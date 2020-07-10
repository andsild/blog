pipeline {
  agent { 
    dockerfile {
      filename 'Dockerfile'
      args '-v /data/.gradle/gradle.properties:/blog/.gradle/gradle.properties -v /run/secrets/deploy-password:/var/deploy-password -u : '
    }
  }
  stages {
    stage('Publish') {
      steps {
          sh 'cd /blog/ && ls -lAr && export GRADLE_USER_HOME=/blog/.gradle/ && export JAVA_HOME= && java --version && ./gradlew publish --info'
          sh '''
            cd /blog/my-site/
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
