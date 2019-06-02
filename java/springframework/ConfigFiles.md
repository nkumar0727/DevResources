# Configuration Files

There are two options:
+ application.properties
+ application.yaml

## .properties

```
# Spring MVC (WebMvcProperties)
spring.mvc.async.request-timeout=1000
spring.mvc.servlet.path=/

# Embedded Server Configuration (ServerProperties)
spring.tomcat.max-connections=10000
spring.tomcat.max-https-post-size=2MB

```
## .yaml
```
spring:
  mvc:
    async:
      request-timeout: 1000
    servlet:
      path: /
  tomcat:
    max-connections: 10000
    max-https-post-size: 2MB
```

## How to Do It?

See [External Configuration](https://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-external-config.html) for both .properties and .yaml setup.

See [this stack overflow post](https://stackoverflow.com/questions/30528255/how-to-access-a-value-defined-in-the-application-properties-file-in-spring-boot) for something quick.

See [this post](https://www.baeldung.com/spring-value-annotation) for something even quicker.

[This](https://www.mkyong.com/spring/spring-propertysources-example/) describes how to use *@PropertySource* to conigure location of the .properties file.
