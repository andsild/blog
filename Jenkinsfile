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
        sh '''mkdir ./target;
        id=$(docker create qwdeblog:latest)
          docker cp $id:/my-site/blog/target/site.bin ./target/
          docker rm -v $id
          '''
      }
    }
    stage('Publish') {
      steps {
        sh '''
          set +x # don't expose password
          token="$(cat /run/var/deploy-password)"
          echo "Doing curl http://qwde.no:9000/hooks/qwde-deploy?token=..."
          curl "http://qwde.no:9000/hooks/qwde-deploy?token=$token&service=blog-download"
          set -x
          '''
      }
    }
  }
}
