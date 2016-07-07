# Main file

The main file (usually labelled `main.scss`) should be the only Sass file from the whole code base not to begin with an underscore. This file should not contain anything but `@import` and comments.

Reference: [Sass Guidelines](http://sass-guidelin.es/) > [Architecture](http://sass-guidelin.es/#architecture) > [Main file](http://sass-guidelin.es/#main-file)

# Custom
Some things have been added to the initial 7-1 pattern to integrate with Bootstrap and enhance the workflow:
- `abstracts/bootstrap` to store Bootstrap variables,
- `abstracts/dev` to buffer some features while developing,
- `base/icons` to add iconset from Icomoon.
