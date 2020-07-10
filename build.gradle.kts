plugins {
  `maven-publish`
}

version = "0.0.1"
description = """
  bloooooog
"""

task<Exec>("builder") {
  description = "build blog"
  buildDir = File("./my-site/")
  workingDir = File("my-site")
  outputs.cacheIf { true }
  commandLine("cabal", "build")
  inputs.files(listOf(fileTree("*.hs"), fileTree("*.cabal")))
    .withPropertyName("sourceFiles")
    .withPathSensitivity(PathSensitivity.RELATIVE)
  outputs.dir("./my-site/dist-newstyle/build/")
}

task<Exec>("installer") {
  dependsOn("builder")
  outputs.cacheIf { true }
  description = "install stuff"
  workingDir = File("my-site")
  commandLine("cabal", "install", "--program-suffix=.bin", ".", "--installdir=target", "--overwrite-policy=always")
  inputs.files(listOf(fileTree("./my-site/image/*"), fileTree("./my-site/*.markdown"), fileTree("my-site/**/.markdown")))
    .withPropertyName("sourceFiles")
    .withPathSensitivity(PathSensitivity.RELATIVE)
  outputs.dir("./my-site/dist-newstyle/target")
}

task<Tar>("zipper") {
  dependsOn("installer")
  compression = Compression.GZIP
  from("./my-site") {
    include(setOf("*.html", "*.markdown", "css/*", "images/*", "posts/*", "templates/*", "target/site.bin"))

    filesMatching("target/site.bin") {
      path = "blog/"
      name = "blog/site.bin"
      }
  }
  into("blog")
  archiveName = "blog.tar.gz"
  destinationDir = File("./my-site/target/")
  //setArchiveBaseName("blog")
  //setArchiveExtension(".tar.gz")
  //setDestinationDirectory(File("./my-site/target/"))
}

val exec = file("./my-site/target/blog.tar.gz")
val haskell by configurations.creating
val artifact = artifacts.add("haskell", exec) {
  type = "tarball"
  builtBy("zipper")
  classifier = "prod"
  name = "blog"
  extension = "tar.gz"
}
val repoUser: String? by project
val repoPassword: String? by project

publishing {
  publications {
    create<MavenPublication>("blog") {
      groupId = "qwde.blog"
      description = "Haskell binary to run isomorhpic HTTP frontend"
      artifact(artifact)
      artifactId = "blog"
      pom {
        name.set("blog")
        description.set("Haskell binary to run blog")
        url.set("http://qwde.no/blog")
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
      url = uri("http://qwde.no:8876/repository/internal/")
      credentials {
          // Store in ~/.gradle/gradle.properties
          username = "admin"
          password = repoPassword
      }
    }
  }
}

