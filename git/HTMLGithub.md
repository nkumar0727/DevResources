# How to View HTML Pages in Github Repositories

## How to Do

1) Go to [raw.githack.com](https://raw.githack.com/)
2) Paste the url of the .html file on your github repo in to the text box
3) Under the section saying, "Use this URL in development", you have the useable link

## What is raw.githack?

You will find far more detailed answers on the page itself. TL;DR ti's a caching proxy which relays content from GitHub to your browser with the correct *Content-Type* headers (GitHub serves them as *text/plain*).

## Notes

Please use the development URL so that your page is not cached for a year on a CDN (this is the case with the production URL).
