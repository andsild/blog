pipeline {
  agent any; 
  stages {
    stage('Build/upload haskell') {
      when { 
        changeset pattern: "Dockerfile|.*\\.(hs|cabal|nix|yaml|kts)", comparator: "REGEXP" 
      }
      steps {
        sh '''
          rm -rv ./my-site/target || true
          mkdir ./my-site/target || true
          docker build -t qwdeblog:latest .
          id=$(docker create qwdeblog:latest)
          docker cp $id:/blog/my-site/target/site.bin ./my-site/target/
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
          cd my-site/
          rm -rv target || true
          mkdir -p target || true
          cd target 
          find .. -name \\*.html -or -name \\*.markdown -or -regex .\\*/css/.\\* -or -regex .\\*/images/.\\* -or -regex .\\*/posts/.\\* -or -regex .\\*/templates/.\\* | tar -zcvf blog.tar.gz -T -
          cd ../..
          ./gradlew publish --info -x publishExecutablePublicationToMavenRepository
        '''
      }
    }
    stage('Deploy') {
      steps {
        sh '''
          set +x # don't expose password
          token="$(cat /run/secrets/deploy-password)"

# TODO
          echo "Doing curl https://qwde.no:9000/hooks/qwde-deploy?service=blogposts&token=..."
          curl "https://qwde.no:9000/hooks/qwde-deploy?token=$token&service=blogposts&artifact=blog&classifier=prod&extension=tar.gz"

          echo "Doing curl https://qwde.no:9000/hooks/qwde-deploy?service=blog&token=..."
          curl "https://qwde.no:9000/hooks/qwde-deploy?token=$token&service=blog&&artifact=site&classifier=prod&extension=bin"
          set -x
          '''
      }
    }
  }
}
