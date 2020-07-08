pipeline {
  agent { 
    dockerfile {
      filename 'Dockerfile'
      args '-v /data/.gradle/gradle.properties:/root/.gradle/gradle.properties -v /run/secrets/deploy-password:/var/deploy-password -v $JAVA_HOME:$JAVA_HOME'
    }
  }
  stages {
    stage('Publish') {
      steps {
          withGradle {
            sh './gradlew publish --info'
          }

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
