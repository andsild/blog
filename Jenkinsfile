pipeline {
  agent any; 
  stages {
    stage('Build') {
      when { 
        changeset "my-site/**\\.(hs|cabal|nix|yaml)"
        comparator: "REGEXP" 
      }
      steps {
        sh 'docker build -t qwdeblog:latest .'
      }
    }


    stage('Upload image') {
      steps {
        sh '''
          mkdir ./my-site/target || true
          id=$(docker create qwdeblog:latest)
          docker cp $id:/blog/my-site/target/blog.tar.gz ./my-site/target/
          docker rm -v $id
          cd target 
          find .. -name \\*.html -or -name \\*.markdown -or -regex .\\*/css/.\\* -or -regex .\\*/images/.\\* -or -regex .\\*/posts/.\\* -or -regex .\\*/templates/.\\* -or -regex .\\*target/site.bin | tar -zcvf blog.tar.gz -T -
          cd ..

          ./gradlew publish --info
        '''
      }
    }
    stage('Publish') {
      steps {
        sh '''
          set +x # don't expose password
          token="$(cat /run/secrets/deploy-password)"
          echo "Doing curl https://qwde.no:9000/hooks/qwde-deploy?service=blog-download&token=..."
          curl "https://qwde.no:9000/hooks/qwde-deploy?token=$token&service=blog-download"
          set -x
          '''
      }
    }
  }
}
