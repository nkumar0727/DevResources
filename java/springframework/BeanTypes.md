# Bean Types

+ Singleton
    + Default, single bean definition to single object instance per Spring IoC container
    + Can use init-method, destroy-method
    ```xml
    <bean id="coach" 
          scope="singleton"
          init-method="init"
          destroy-method="cleanUp">
    </bean>
    ```
    ```java
    // singletonCoach == singletonCoach2
    final Coach singletonCoach1 = context.getBean("coach", Coach.class);
    final Coach singletonCoach2 = context.getBean("coach", Coach.class);
    ```
+ Prototype
    + Single bean definition scoped to any number of object instances
    + Each request for a prototype bean creates  new object
    + CANNOT have destroy-method; resources are garbage collected if no resources are held onto by the bean
        + Workaround is to [create a singleton destructor bean](https://stackoverflow.com/questions/50681027/do-spring-prototype-beans-need-to-be-destroyed-manually) which explicitly calls destructor hooks of prototype bean 
+ *Web-Aware SpringApplicationContext ONLY*
    + Request
        + Each HTTP request has its own instance of bean created by single bean definition
    + Session
        + Single bean definition tied to the lifecycle of entire HTTP Session 
    + Global Session
        + No clue...
