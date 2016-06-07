# Starter

[![MIT license](https://img.shields.io/badge/license-MIT-yellow.svg?style=flat-square)](LICENSE)

This starter has been made for internal purposes at GLOBALIS media systems.
*It loads Bootstrap v3.3.6 & jQuery v2.2.4 by default.*

Please read the following instructions before starting to code.
These are set to help keeping the project clean and obvious to future developers.
You may need to break these rules. When that happens, please consider:

- being as obvious as possible,
- document and/or comment your changes (both is best).

If you feel that anything looks strange or wrong, please give a feedback.
The starter may evolve through time and experiences.

Thanks,  
[Nicolas Torres](mailto:nicolas.torres@globalis-ms.com)




---
# Workflow

## Install

- open terminal,
- clone this repo and `cd your_destination_folder`,
- `rm -Rf .git` to be able to init a new git project,
- run `npm run init` and wait.

## Development
When developing, run `npm run watch` and keep your terminal open.
That's the only command you'll need to know.

It will generate `public/css/main.css` and `public/js/main.js` and their *sourcemap* files.

**Notes:**
- All files from `sources/js/` will merged into `public/js/main.js`, so do not put external libs in there, and make sure `main.js` is the last file in the alphabetical order (more about naming files in the JavaScript section below).
- Compiled CSS & JS files are ignored by git, so if you work in team, always run `npm run watch` after a `git pull` and before you start working.

## Production
Going to production is usually dictated by the back-end developer.
However, you may need to minify your sources.
If so, just run `npm run build` and minified sources will be available in `public/css/main.min.css` and `public/js/main.min.js`.

## Adding dependencies
The starter loads Bootstrap v3.3.6 & jQuery v2.2.4 by default.
To add dependencies, please use [Bower](http://bower.io/) and edit `bower.json`.





---
# General notes

## Adding sources
Sourcemaps helps you locate information on the source files via your browser developer tool, so merged files remain transparent to you.

So basically:
- when you create CSS files, make sure they are included by `sources/scss/main.scss`,
- when you create JS files, make sure they are before `sources/js/main.js` in the alphabetical order (as they should, using naming convention below).

Except for external libraries, you should not need to manually declare custom styles and scripts into `index.php`.

## Versioning assets (prod only)
There is a versioning helper in the `.htaccess` that redirects any `name-vX.X.X.min.css` to `name.min.css`, and same for `.js` files.
So you can keep a single `main.min.css` and linking a different version in your HTML to force refreshing browser cache.

## Images
There are two folders for images:
- `images` is meant for theme images,
- `uploads` is where all the content images goes, meant to be added by the final user (i.e. through a back-office).




---
# Stylesheets

## File tree
Scss files are stored into `sources/scss/` folder, following these rules:

- `_common.scss` is for main header, main footer & other common elements across pages,
- `_global.scss` if for Bootstrap overrides, default global styles (like `body`), and utility classes,
- `_variables.scss` contains all the Bootstrap & custom variables,
- then each component/page has its own file, except for single selectors or very small sets of items, which are put into `_misc.scss`,
- if you don't know where to put some code, use `_dev.scss`, but try to keep it clean as much as you can (empty is best).

You'll find notes in those files to help you keep your CSS clean.

## Naming convention
```scss
// bootstrap
.bootstrap-classes {}

// custom
.u-utilityClass {}
.componentName-descendantName {}
.componentName-descendantName--modifier {}
.componentName-descendantName.is-stateName {}

// for JS only
.js-selectorName {}
[data-attr-name] {}
```

## Defining styles
Try to:
- avoid styling over ID selectors,
- avoid using `!important` (but using Bootstrap it happens a lot more than usual),
- avoid nesting selectors, except for:

```scss
// Boostrap overrides
.customNav {
    .nav.nav-tabs {
        a.active {
            color: red;
        }
    }
}

// Element states & pseudo-elements
.customElement {
    color: black;

    &:hover, &:focus { color: red; }
    &.active { color: green; }
    &.disabled { color: gray; }
    &.is-customState { color: blue; }
}

// Parents modifiers
.customElement {
    background: black; // default background

    .wrapper--red & { background: red; }
    .wrapper--blue & { background: blue; }
}

// Lists and consistent DOM trees
.customNav {
    ul {
        list-style: none;
    }

    li {
        display: inline-block;

        &.active a {
            text-decoration: underline;
        }
    }
}
```

- avoid duplicating behaviors, prefer using `%selector` helpers:

```scss
%component-heading {
    // common styles
}

.component-title {
    @extend %component-heading;
    // specific styles
}

.component-subtitle {
    @extend %component-heading;
    // specific styles
}
```

## Applying styles
Prefer applying multiple classes to elements instead of extending selectors.
This way, looking at the DOM (as messy as it may look like) give you instant hints about elements styles cascade.
It makes the HTML a bit ugly, but allows us to keep a cleaner CSS which is much more important.

Try to keep the classes in that order: **component, modifiers, Bootstrap, utilities, js**.

```html
<ul class="homeNav homeNav--snap nav nav-tabs u-uppercase js-snap">
    <!-- … -->
</ul>
```




---
# JavaScript
Thanks to [Babel](https://babeljs.io/), ES2015 (or ES6) is enabled.
[Learn ES2015](https://babeljs.io/docs/learn-es2015/)

## Keeping it clean
You only need to work on `sources/js/`.
There are example files to help you start developing your components/plugins.

Here are some little instructions in order to keep your scripts clean:

- create one file per component (jQuery plugins are components),
- add an underscore prefix to your custom components/helpers (`_example-component.js`),
- add `.jquery` prefix to your custom jQuery plugins (`jquery.example-plugin.js`),
- fragment your code into as many components as possible,
- global scope is limited to helpers and component objects only.

`sources/js/main.js` is the **flow**, where all the components are instantiated & their interactions described:

- use a function wrapper,
- instantiate components & plugins here:

```js
// bind tooltips
$('[data-toggle="tooltip"]').tooltip();

// bind datepickers
if ($.fn.datepicker)
    $('.js-datepicker').datepicker({
        // options
    });
```

- avoid writing logic (algorithms),
- but put behaviors that are really small or non-specific like:

```js
// confirm action on click
// NOTE global, non-specific
$('[data-confirm]').on('click', function() {
    return confirm($(this).data('confirm'));
});

// focus on search input when open (Bootstrap event)
// NOTE specific but small
var search = $('#search');
if (search.length) { // NOTE so it won't break when the element is missing
    search.on('shown.bs.dropdown', function () {
        $('#search-input').focus();
    });
}
```




---

# Icons
Default social icons are loaded with [Icomoon](https://icomoon.io/app/).

To use them, simply write `<i class="icon-facebook"></i>` (for example).

To add new icons:
- go to https://icomoon.io/app/#/projects,
- click on “Import project”,
- select `sources/icomoon.json` file,
- add icons,
- download your icon font,
- replace `sources/icomoon.json` by `selection.json` (rename it),
- replace icon selectors in `sources/scss/_icons.scss` with thoses in `style.css`,
- merge `fonts/` into `public/fonts/`.
