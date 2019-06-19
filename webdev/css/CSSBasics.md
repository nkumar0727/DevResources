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
