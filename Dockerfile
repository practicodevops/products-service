FROM openjdk:8-jdk-alpine AS build
WORKDIR /build
COPY . /build
RUN ./mvnw -B package

FROM openjdk:8-jdk-alpine AS run
WORKDIR /app
COPY --from=build /build/target/products-service-example-0.0.1-SNAPSHOT.jar app.jar
CMD java -jar app.jar