plugins {
  `maven-publish`
}

version = "0.0.1"
description = """
  bloooooog
"""

val haskell by configurations.creating
val exec = file("./my-site/target/blog.tar.gz")
val artifact = artifacts.add("haskell", exec) {
  type = "tarball"
  classifier = "prod"
  name = "blog"
  extension = "tar.gz"
}
val executable = file("./my-site/target/site.bin")
val artifactExecutable = artifacts.add("haskell", executable) {
  type = "executable"
  classifier = "prod"
  name = "site"
  extension = "bin"
}
val repoUser: String? by project
val repoPassword: String? by project

publishing {
  publications {
    create<MavenPublication>("blog") {
      groupId = "qwde.blog"
      description = "Blog content"
      artifact(artifact)
      artifactId = "blog"
      pom {
        name.set("blog")
        description.set("Haskell binary to run blog")
        url.set("https://qwde.no/blog")
        developers {
          developer {
            id.set("andsild")
            name.set("Anders")
            email.set("trolo@lol.lol")
          }
        }
      }
    }
    create<MavenPublication>("executable") {
      groupId = "qwde.blog"
      description = "Hakyll executable"
      artifact(artifactExecutable)
      artifactId = "site"
      pom {
        name.set("blog")
        description.set("Haskell binary to run blog")
        url.set("https://qwde.no/blog")
        developers {
          developer {
            id.set("andsild")
            name.set("Anders")
            email.set("trolo@lol.lol")
          }
        }
      }
    }
  }
  repositories {
    maven {
      url = uri("https://qwde.no/archiva/repository/internal/")
      credentials {
          // Store in ~/.gradle/gradle.properties
          username = "admin"
          password = repoPassword
      }
    }
  }
}

