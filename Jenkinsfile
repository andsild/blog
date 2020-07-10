pipeline {
  agent any; 
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t qwdeblog:latest .'
      }
    }

    stage('Publish') {
      steps {
          sh 'mkdir ./target && docker cp qwdeblog:latest:/my-site/blog/target/site.bin ./target/'
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
