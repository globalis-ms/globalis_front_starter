# Front-end guidelines

- [General notes](#general-notes)
- [Stylesheets](#stylesheets)
- [JavaScript](#javascript)
- [Icons](#icons)





## General notes

### Adding sources

Sourcemaps helps you locate information on the source files via your browser developer tool, so merged files remain transparent to you.

So basically:

- when you create CSS files, make sure they are included by `sources/scss/main.scss`,
- when you create JS files, make sure they are before `sources/js/main.js` in the alphabetical order (as they should, using naming convention below).

Except for external libraries, you should not need to manually declare custom styles and scripts into `index.php`.

Edit [bower.json](bower.json) and run `make install` to add front-end dependencies.

### Versioning assets (prod only)

There is a versioning helper in the `.htaccess` that redirects any `name-vX.X.X.min.css` to `name.min.css`, and same for `.js` files. So you can keep a single `main.min.css` and linking a different version in your HTML to force refreshing browser cache.

### Images

There are two folders for images:

- `images` is meant for theme images,
- `uploads` is where all the content images goes, meant to be added by the final user (i.e. through a back-office).





## Stylesheets

### File tree

SCSS files are stored into `sources/scss/` folder, following these rules:

- `_common.scss` is for main header, main footer & other common elements across pages,
- `_global.scss` if for Bootstrap overrides, default global styles (like `body`), and utility classes,
- `_variables.scss` contains all the Bootstrap & custom variables,
- then each component/page has its own file, except for single selectors or very small sets of items, which are put into `_misc.scss`,
- if you don't know where to put some code, use `_dev.scss`, but try to keep it clean as much as you can (empty is best).

You'll find notes in those files to help you keep your CSS clean.

**Note:** for large-scale applications, you may need a better CSS workflow such as [the 7-1 pattern](http://sass-guidelin.es/#the-7-1-pattern).

### Naming convention

```scss
// bootstrap
.bootstrap-classes {}

// custom
.u-utilityClass {}
.ComponentName-descendantName {}
.ComponentName-descendantName--modifier {}
.ComponentName-descendantName.is-stateName {}

// for JS only
.js-selectorName {}
[data-attr-name] {}
```

### Defining styles

Try to:

- avoid styling over ID selectors,
- avoid using `!important` (but using Bootstrap it happens a lot more than usual),
- avoid nesting selectors, except for:

```scss
// Boostrap overrides
.CustomNav {
  .nav.nav-tabs {
    a.active { color: red; }
  }
}

// Element states & pseudo-elements
.CustomElement {
  color: black;

  &:hover, &:focus { color: red; }
  &.active { color: green; }
  &.disabled { color: gray; }
  &.is-customState { color: blue; }
}

// Parents modifiers
.CustomElement {
  background: black; // default background

  .Wrapper--red & { background: red; }
  .Wrapper--blue & { background: blue; }
}

// Lists and consistent DOM trees
.CustomNav {
  ul { list-style: none; }

  li {
    display: inline-block;
    &.active a { text-decoration: underline; }
  }
}

// Making components: compiled CSS won't be nested
.Component {
  &-title { … } // .Component-title
  &-subtitle { … } // .Component-subtitle
}
```

- avoid duplicating behaviors, prefer using `%selector` helpers:

```scss
%Component-heading {
  // common styles
}

.Component-title {
  @extend %Component-heading;
  // specific styles
}

.Component-subtitle {
  @extend %Component-heading;
  // specific styles
}
```

### Applying styles

Prefer applying multiple classes to elements instead of extending selectors. This way, looking at the DOM (as messy as it may look like) give you instant hints about elements styles cascade. It makes the HTML a bit ugly, but allows us to keep a cleaner CSS which is much more important.

Try to keep the classes in that order: **component, modifiers, Bootstrap, utilities, js**.

```html
<ul class="HomeNav HomeNav--snap nav nav-tabs u-uppercase js-snap">
  <!-- … -->
</ul>
```




## JavaScript

### Keeping it clean

You only need to work on `sources/js/`. There are example files to help you start developing your components/plugins.

Here are some little instructions in order to keep your scripts clean:

- create one file per component (jQuery plugins are components),
- add an underscore prefix to your custom components/helpers (`_example-component.js`),
- add `jquery.` prefix to your custom jQuery plugins (`jquery.example-plugin.js`),
- fragment your code into as many components as possible,
- global scope is limited to helpers and component objects only.

`sources/js/main.js` is the **flow**, where all the components are instantiated & their interactions described:

- use a function wrapper,
- instantiate components & plugins here:

```javascript
// bind tooltips
$('[data-toggle="tooltip"]').tooltip();

// bind datepickers
if ($.fn.datepicker) {
  $('.js-datepicker').datepicker({
    // options
  });
}
```

- avoid writing logic (algorithms),
- but put behaviors that are really small or non-specific like:

```javascript
// confirm action on click
// NOTE global, non-specific
$('[data-confirm]').on('click', function() {
  return confirm($(this).data('confirm'));
});

// focus on search input when dropdown opens (Bootstrap event)
// NOTE specific but small
var search = $('#search');
if (search.length) { // NOTE so it won't break when the element is missing
  search.on('shown.bs.dropdown', function () {
    $('#search-input').focus();
  });
}
```




## Icons
Icons are loaded with [Icomoon](https://icomoon.io/app/).

To use them, simply write `<i class="icon-favorite"></i>` (for example).

To add new icons:
- go to https://icomoon.io/app/#/projects,
- click on “Import project”,
- select `sources/icomoon.json` file,
- add icons,
- download your icon font,
- replace `sources/icomoon.json` by `selection.json` (rename it),
- open `sources/scss/_icons.scss` and replace icon selectors with those in `style.css`,
- merge `fonts/` into `public/fonts/`.
