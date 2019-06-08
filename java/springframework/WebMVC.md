# Web MVC Overview

## How It Works

Spring MVC is a request driven framework.

This is the lifecycle of a request.
![alt text](./img/RequestLifecycle.png)

1. DispatcherServlet receives the request.
2. DispatcherServlet dispatches the task of selecting an appropriate controller to HandlerMapping. HandlerMapping selects the controller which is mapped to the incoming request URL and returns the (selected Handler) and Controller to DispatcherServlet.
3. DispatcherServlet dispatches the task of executing of business logic of Controller to HandlerAdapter.
4. HandlerAdapter calls the business logic process of Controller.
5. Controller executes the business logic, sets the processing result in Model and returns the logical name of view to HandlerAdapter.
6. DispatcherServlet dispatches the task of resolving the View corresponding to the View name to ViewResolver. ViewResolver returns the View mapped to View name.
7. DispatcherServlet dispatches the rendering process to returned View.
8. View renders Model data and returns the response.


This [post](https://terasolunaorg.github.io/guideline/1.0.1.RELEASE/en/Overview/SpringMVCOverview.html) does a good job explaining additional details.

## Configuration

Each spring application context can contain multiple Spring Servlets.

### XML Files

Spring apps have 2 types of context config for Spring MVC:
+ ApplicationContext (*applicationContext.xml*)
+ WebApplicationContext (*xxx-servlet.xml*, where xxx is the DispatcherServlet name in *web.xml*)

#### ApplicationContext

+ *applicationContext.xml* read and ApplicationContext created for whole app (one and ONLY one)
+ should declare context config filename in *web.xml*
    ```xml
    <context-param>
        <param-name>contextConfigLocation</param-name>
        <param-value>/WEB-INF/applicationContext.xml</param-value>
    </context-param>
    ```

#### WebApplicationContext

+ Can be multiple WebApplicationContext in single webapp
    + Each DispatcherServlet associated with single WebApplicationContext
    + Can be multiple DispatcherServlets in a webapp to handle requests

Here is the hierarchy:
+ ApplicationContext (*applicationContext.xml*)
    + DispatcherServlet --> WebApplicationContext (*xxx-servlet.xml*)

So *applicationContext* is common for ALL servlet config files

#### ContextLoaderListener

Creates multiple dispatcher servlets for an application context.

For multiple servlets, I recommend you read [this](https://stackoverflow.com/questions/11815339/role-purpose-of-contextloaderlistener-in-spring) post about *contextLoaderListener*.

#### Dispatcher Servlets

Should add support for/define:
+ component scan
+ conversion, formatting, validation
+ view resolver

For example, in dispatcher1-servlet.xml:
```xml
<!-- Component Scan -->
<context:component-scan base-package="com.nikhil.demo" />

<!-- Conversion, Formatting, Validation-->
<mvc:annotation-driven />

<!-- View Resolver -->
<bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
  <property name="prefix" value="/WEB-INF/view/" />
  <property name="suffix" value=".jsp" />
</bean>

```

#### URL Mapping to Dispatcher Servlet

This Dispatcher Servlet takes in all requests having the */explorer* path:
```xml
<servlet-mapping>
  <servlet-name>dispatcher1</servlet-name>
  <url-pattern>/explorer</url-pattern>
</servlet-mapping>
```

### Example

Example with 2 WebApplicationContexts (DispatcherServlets):
```xml
<context-param>
  <param-name>contextConfigLocation</param-name>
  <param-value>/WEB-INF/applicationContext.xml</param-value>
</context-param>

<listener>
  <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
</listener>

<servlet>
  <servlet-name>dispatcher1</servlet-name>
  <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
  <init-param>
    <param-name>contextConfigLocation</param-name>
    <param-value>/WEB-INF/dispatcher1-servlet.xml</param-value>
  </init-param>
  <load-on-startup>1</load-on-startup>
</servlet>

<servlet>
  <servlet-name>dispatcher2</servlet-name>
  <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
  <init-param>
    <param-name>contextConfigLocation</param-name>
    <param-value>/WEB-INF/dispatcher-servlet.xml</param-value>
  </init-param>
  <load-on-startup>1</load-on-startup>
</servlet>
```