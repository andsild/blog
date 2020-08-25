FROM haskell:8 as build
COPY my-site /blog/my-site/
COPY ./build.gradle.kts /blog/
COPY ./settings.gradle.kts /blog/
COPY ./gradle/ /blog/gradle/
COPY ./gradlew /blog/
WORKDIR /blog/my-site/
RUN stack setup && stack install hakyll && stack init
RUN stack init && stack install --local-bin-path=target && mv -v ./target/site ./target/site.bin
#RUN cd target && find .. -name \*.html -or -name \*.markdown -or -regex .\*/css/.\* -or -regex .\*/images/.\* -or -regex .\*/posts/.\* -or -regex .\*/templates/.\* -or -regex .\*target/site.bin | tar -zcvf blog.tar.gz -T -

FROM build as runner
COPY docker-entrypoint.sh /usr/local/bin
# Hakyll's default port is 127.0.0.1, but for exposure through docker we need 0.0.0.0
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["./my-site/target/site.bin" "my-site", "watch", "--", "--host", "0.0.0.0"]
