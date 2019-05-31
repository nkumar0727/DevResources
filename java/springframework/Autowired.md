# Using Autowired

## Types of Injection
+ Constructor Injection
    + ```java
       private DependencyBean dependencyBean;

       @Autowired
       public MyBean(final DependencyBean dependencyBean) {
          this.dependencyBean = dependencyBean;
       }
      ```
+ Setter Injection
    + Setter gets called *right after* bean gets created
    + Useful if no injection in constructor, can only be for setter function
    + ```java
       private DependencyBean dependencyBean;

       public MyBean() {
          ...
       }

       @Autowired
       public void setDependencyBean(final DependencyBean dependencyBean) {
          this.dependencyBean = dependencyBean
       }
      ```

+ Method Injection
    + Method gets called *right after* beans gets created
    + Useful if you have other processing going on; not just a setter function
    + ```java

       public MyBean() {
          ...
       }

       @Autowired
       public void processPayment(final DependencyBean dependencyBean) {
          dependencyBean.setupPayment();
          ...
       }
      ```

+ Field Injection
    + Uses reflection to automatically set fields in object
    + Useful when you don't want a setter or have a NoArgsConstructor (or no constructor)
    + ```java
       @Autowired
       private DependencyBean dependencyBean;

       public MyBean() {
          ...
       }
      ```

## Which Injection to Use?
Choose one, but be consistent. And do it where it applies the best; you can determine this based on the descriptions and advice above.

## Using @Qualifier
Main use case is if there are multiple implementations of an interface/superclass.
+ FortuneService
    + DatabaseFortuneService
    + RESTFortuneService
    + RandomFortuneService

To resolve ambiguity, use @Qualifier to specify the exact BeanID when there are multiple beans of the same type.

Otherwise, you'll get *NoUniqueBeanDefinitionException*

```java
public class TennisCoach implements Coach {
  @Autowired
  @Qualifier("randomFortuneService")
  private FortuneService fortuneService;

  ...
}
```
