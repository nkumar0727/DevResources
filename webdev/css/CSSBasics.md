# Basics of CSS

```css
selector {
  property: value
}

h1 {
  color: blue
}
```

## How to do?

1) In Tag

```html
<!-- This will be colored blue  -->
<h1 style="color: blue;">
  About Me
</h1>
```

2) Inline

```html
<style>
  h1 {
    color: blue
  }
</style>
```

3) css file

```html
<link rel="stylesheet" type="text/css" href="cssBasics.css">
```

You should put this in the <head></head> section.

This is the standard, unless in a rare usecase (debugging).

## Colors

1) Hexadecimal

```css
# This is black
h1 {
  color: #000000;
}

h2 {
  color: #4B0082;
}

# This is white
h3 {
  color: #FFFFFF;
}
```

Every two hex digits = 1 byte = 1 color channel
RR GG BB = red green blue

2) RGB (Red, Green, Blue)

Each channel ranges from 0 - 255

```css
h1 {
  color: rgb(128,54,0)
}
```

3) RGBA (Red, Green, Blue, Alpha)

Alpha is a transparency channel, which ranges from 0.0 - 1.0.

0 alpha means completely transparent
1 alpha means completely opaque

```css
h1 {
  color: rgba(11, 99, 159, 0.2)
}
```

4) ASCII Text

```css
h1 {
  color: blue
}
```

## Backrounds

```css

# With a url
body {
  background: url(http://path-to-image);
  background-repeat: no-repeat;
  backgraound-size: cover;
}
```

## Selectors

You can select shit.

### Elements

```css
li {

}
```

### Classes

```css
.hello {

}
```

### Star

  + Can select everything
  + Typically used with child selectors or to clear formatting

```css
* {

}
```

### Descendants

+ The following example: *"select any \<a> inside a \<div> inside a \<li> and color it red"*

```css
li div a {
  color: red
}
```

### Adjacents

+ The following example: *"select any \<ul> which comes just after \<h4> and give it a solid red border"*

```css
h4 + ul {
  border: 4px solid red
}
```

### Attribute

+ The following example: *"select any \<a> who has href of google.com and give it blue background"*

```css
a[href="http://www.google.com"] {
  background: blue
}
```

### nth of Type

+ The following example: *"select the 3rd \<li> within the same parent tag and color it red"*

```css
li:nth-of-type(3) {
  color: red
}
```

## Selector Specificity

Let's say you have the following selectors:

```css
body {
  color: red;
}

ul {
  color: blue;
}

li {
  color: black;
}

.highlight {
  color: orange;
}

#special {
  color: pink;
}
```

With the following html:

```html
<body>
  <ul>
    <li id="special" class="highlight">One</li>
    <li>Two</li>
    <li>Three</li>
    <li class="highlight">Four</li>
  </ul>
</body>
```

What will each thing be colored? Click [here](https://rawcdn.githack.com/nkumar0727/DevResources/b11e8f8056cef39b7a589041cff569f20b390487/webdev/css/specificity.html) for the answer.

It turns out that precedence is in the following order:
1) id
2) class
3) most deeply nested tag
4) less deeply nested dag

## Fonts

```css
body {
  font-size: 10px
}

p {
  font-family" Arial, Helvetica, sans-serif;
  font-size: 4.0em;
  font-weight: bold
}

h1 {
  font-size: 5.0em
}

span {
  font-size: 2.5em
}
```

In the above case, we have the following html:

```html
<body>
  <h1>
  </h1>
  <p>
    <span>
    </span>
  </p>
</body>
```

The header is 5 times the size of the body.
The paragraph is 4 times the size of the body.
The span is 2.5 * 4 = 10 times the size of the body.

## Google Fonts

[Google Fonts](www.google.com/fonts)

You can use this to get better fonts than the ones innately provided.

## Box Model

Each element in a document is represented as a rectangular box.

In CSS, each of these boxes is described using the **standard box model**:
+ Content
+ Padding
+ Border
+ Margin

![Standard Box Model](./box_model.png)

```css
p {
  width: 50%; # 50% of the parent tag (<body> in this case)

  border: 2px solid blue;

  padding-left: 40px;

  margin: 100px; # everywhere
  margin-top: 200px;
  margin: 20px 40px 500px 100px; # top, right, bottom, left
}
```
