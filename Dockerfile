FROM haskell:8 as build
RUN stack install hakyll
COPY my-site /blog/my-site/
COPY ./build.gradle.kts /blog/
COPY ./settings.gradle.kts /blog/
COPY ./gradle/ /blog/gradle/
COPY ./gradlew /blog/
WORKDIR /blog/my-site/
RUN stack setup
RUN stack install --local-bin-path=target && mv -v ./target/site ./target/site.bin
RUN find . -name \*.html -or -name \*.markdown -or -regex .\*/css/.\* -or -regex .\*/images/.\* -or -regex .\*/posts/.\* -or -regex .\*/templates/.\* -or -regex .\*target/site.bin | tar -zcvf prod.tar.gz -T -

FROM build as runner
COPY docker-entrypoint.sh /usr/local/bin
# Hakyll's default port is 127.0.0.1, but for exposure through docker we need 0.0.0.0
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["./my-site/target/site.bin" "my-site", "watch", "--", "--host", "0.0.0.0"]
