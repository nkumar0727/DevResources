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

It turns out


