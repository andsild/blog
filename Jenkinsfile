pipeline {
  agent any; 
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t qwdeblog:latest .'
      }
    }

    stage('Upload image') {
      steps {
        sh '''
          mkdir ./my-site/target || true
          id=$(docker create qwdeblog:latest)
          docker cp $id:/blog/my-site/target/blog.tar.gz ./target/
          docker rm -v $id
          ./gradlew publish --info --dependecy-verification=off
        '''
      }
    }
    stage('Publish') {
      steps {
        sh '''
          set +x # don't expose password
          token="$(cat /run/secrets/deploy-password)"
          echo "Doing curl http://qwde.no:9000/hooks/qwde-deploy?token=..."
          curl "http://qwde.no:9000/hooks/qwde-deploy?token=$token&service=blog-download"
          set -x
          '''
      }
    }
  }
}
