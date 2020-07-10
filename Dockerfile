FROM ubuntu:18.04 as build
RUN apt-get update && apt-get install -y \
  software-properties-common \
  libghc-zlib-dev

RUN add-apt-repository ppa:hvr/ghcjs
RUN add-apt-repository ppa:hvr/ghc
RUN apt-get update && apt-get install -y ghcjs-8.4 ghc-8.4.4 cabal-install-3.2 default-jdk
ENV PATH="/opt/ghc/bin:/opt/ghcjs/bin:${PATH}"
RUN cabal update && cabal new-install hakyll 

COPY my-site /blog/my-site/
COPY ./build.gradle.kts /blog/
COPY ./settings.gradle.kts /blog/
COPY ./gradle/ /blog/gradle/
COPY ./gradlew /blog/
WORKDIR /blog
RUN GRADLE_USER_HOME="/blog/.gradle/" ./gradlew --rerun-tasks -q zipper --info

FROM build as runner
COPY docker-entrypoint.sh /usr/local/bin
# Hakyll's default port is 127.0.0.1, but for exposure through docker we need 0.0.0.0
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["./my-site/target/site.bin" "my-site", "watch", "--", "--host", "0.0.0.0"]
