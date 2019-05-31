# Using Component Scan

## How it works
Components are beans which will be created by the BeanFactory when the IoC container starts up. These should be heavyweight objects that last long.

Spring will scan certain packages to look for classes annoted with *@Component*, or any of its subclasses:
+ *@Service*
    + Utility classes, or class which provides some service
+ *@Repository*
    + CRUD operation class
    + Usually used with DAO implementations dealing with DB tables
+ *@Controller*
    + Web Apps or REST web services
    + Handles user request and return response

**Note**: Best practice to use one of the 3 subclasses, and not just *@Component*.

## Usage

### Annotate Component Files
```java
@Component("restFortuneService")
public class RESTFortuneService implements FortuneService {

}
```

### Enabling Component Scan
1. XML Configuration
    + In XML config file:
        ```xml
        <context:component-scan base-package="package.containing.components" />
        ```
    + In SpringMainClass:
        ```java
        public static void main(String[] args) {
            ClassPathXMLApplicationContext context = new ClassPathXMLApplicationContext("applicationContext.xml");

            FortuneService fortuneService = context.getBean("restFortuneService", FortuneService.class);
            ...
            context.close();
        }
        ```
2. Annotation Configuration
    + In SpringMainClass:
        ```java
        public static void main(String[] args) {
            AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
            context.scan("package.containing.components");
            context.refresh();

            FortuneService fortuneService = context.getBean("restFortuneService", FortuneService.class);
            ...
            context.close();
        }
        ```


3. Code Configuration
