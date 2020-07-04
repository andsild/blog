node {
  def customImage = docker.build("blog:latest", "--target build")

   tools {
    'org.jenkinsci.plugins.docker.commons.tools.DockerTool' '18.09'
    }

  customImage.inside {
    withGradle {
      sh './gradlew publish --info'
    }

    sh '''
      set +x # don't expose password
      token="$(cat /run/secrets/deploy-password)"
      echo "Doing curl http://qwde.no:9000/hooks/qwde-deploy?token=..."
      curl "http://qwde.no:9000/hooks/qwde-deploy?token=$token&service=blog-download"
      set -x
      '''
  }
}
