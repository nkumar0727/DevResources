# Forms

## Action

```html
<form action="/urlAppendedToBase" method="GET">
</form>
```

The **action** can be an absolute or relative (to the html page) url.

In the above example, say the html page is www.mypage.com/stuff/index.html.
Clicking the form would send a GET request to www.mypage.com/urlAppendedToBase.

You can suggest a brand new URL using the specific protocol:

```html
<form action="http://www.google.com" method="GET">
</form>
```

## Method

The 2 main ones are **GET** and **POST**:

### Behaviours

1. History 
    + GET - params remain in history (part of URL)
    + POST - params saved in history

2. BACK Button/Resubmit
    + GET - re-executed, but cannot be re-submitted to server if HTML stored in browser cache
    + POST - browser urually alerts data re-submission

3. Parameters
    + GET - Limited to URL capacity, safest to use < 2K (based on server)
    + POST - Higher capacity, can even send files

4. Restrictions on Data Type
    + GET - only ASCII characters
    + POST - no restrictions, even binary data allowed

5. Security
    + GET - less secure than post b/c data sent is part of URL
        + Saved in browser history + server logs
    + POST - safer than GET b/c params not stored in browser history + server logs

6. Restrictions on Data Length
    + GET - URL length restricted (usually 2048 chars)
    + POST - no restrictions

7. Usability
    + GET - should not be used for sensitive info
    + POST - used for sensitive info

8. Visibility
    + GET - visible to everyone (in address bar)
    + POST - not visible in URL

9. Caching
    + GET - can be cached
    + POST - not cached

## Inputs

### Example

```html
<label for="idOfInputTag">InputLabel</label>
<input id="idOfInputTag" name="paramName" type="text" placeholder="paramPlaceholder">

<!-- or... -->
<label>
  <input id="idOfInputTag" name="paramName" type="text" placeholder="paramPlaceholder">
</label>

<!-- creates a larger text area than <input>  -->
<textarea name="body" cols="30" rows="10"></textarea>
```

### Types

Some of the many for types; there are lots more...

+ text - basic text
+ password - hides password onscreen
+ email - enforces email format
+ date - browser dependent
+ submit - when clicked, will perform method on resource and use input tags within the form tag as parameters
+ dropdowns
    ```html
    <select name="paramName">
      <option value="paramActualValue">UserFacingValye</option>
      ...
    </select>
    ```

### Validation

Some basic validation can be performed client side. However, this is no substitute for server side validation, which is a **MUST**.

+ Required Inputs

    ```html
      <input type="text" required>
    ```

+ Pattern

    ```html
    <input type="password" name="password" pattern=".{5,10}" required title="Password must be 5-10 characters" />
    ```
