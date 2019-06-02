# Configuring a Spring Container

1. Full XML Config
  ```xml
  <bean id="myFortuneService"
        class="com.nikhil.springdemo.RandomFortuneService">
  </bean>

  <bean id="myCoach"
        class="com.nikhil.springdemo.TennisCoach">

        <!-- constructor injection -->
        <constructor-arg ref="myFortuneService" />
  </bean>

  <bean id="myOtherCoach"
        class="com.nikhil.springdemo.CricketCoach">

        <!-- setter injection -->
        <property name="fortuneService" ref="myFortuneService" />
  </bean>
  ```
2. XML Component Scan

    In *applicationContext.xml*:
    ```xml
    <context:component-scan base-package="com.nikhil.springdemo" />
    ```

3. Code Config
    ```java
    /**
    * @Configuration tells us this class is for container config
    * @ComponentScan tells us which package to look for beans annotated by @Component subclasses
    *   - An alternative is to setup beans ourselves in this class
    */

    @Configuration
    @ComponentScan("com.nikhil.springdemo")
    public class SpringConfig {

    } 
    ```
    In *Application.java*:
    ```java
    public static void main(String[] args) {
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(SpringConfig.class);
    }
    ```