pipeline {
  agent any; 
  stages {
    stage('Build/upload haskell') {
      when { 
        changeset pattern: "Dockerfile|.*\\.(hs|cabal|nix|yaml|kts)", comparator: "REGEXP" 
      }
      steps {
        sh '''
          mkdir ./my-site/target || true
          docker build -t qwdeblog:latest .
          id=$(docker create qwdeblog:latest)
          docker cp $id:/blog/my-site/target/blog.tar.gz ./my-site/target/
          docker rm -v $id
          ./gradlew publish --info -x publishBlogPublicationToMavenRepository
        '''
      }
    }


    stage('Upload image') {
      when { 
        changeset pattern: ".*\\.(html|html|css|md)|.*/(templates|posts|images)/.*", comparator: "REGEXP" 
      }
      steps {
        sh '''
          rm -rv target || true
          mkdir -p target || true
          cd target 
          find .. -name \\*.html -or -name \\*.markdown -or -regex .\\*/css/.\\* -or -regex .\\*/images/.\\* -or -regex .\\*/posts/.\\* -or -regex .\\*/templates/.\\* | tar -zcvf blog.tar.gz -T -
          cd ..
          ./gradlew publish --info -x publishExecutablePublicationToMavenRepository
        '''
      }
    }
    stage('Deploy') {
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
