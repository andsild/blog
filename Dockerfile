FROM ubuntu:18.04 as build
RUN apt-get update && apt-get install -y \
  software-properties-common \
  libghc-zlib-dev

RUN add-apt-repository ppa:hvr/ghcjs
RUN add-apt-repository ppa:hvr/ghc
RUN apt-get update && apt-get install -y ghcjs-8.4 ghc-8.4.4 cabal-install-3.2
ENV PATH="/opt/ghc/bin:/opt/ghcjs/bin:${PATH}"
RUN cabal update && cabal new-install hakyll 

COPY my-site /my-site
WORKDIR /my-site
RUN cabal build

FROM build as runner
# Hakyll's default port is 127.0.0.1, but for exposure through docker we need 0.0.0.0
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["cabal", "run", "my-site", "watch", "--", "--host", "0.0.0.0"]
