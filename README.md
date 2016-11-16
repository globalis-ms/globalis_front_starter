# Starter

[![MIT license](https://img.shields.io/badge/license-MIT-yellow.svg?style=flat-square)](LICENSE)

This starter has been made for internal purposes at GLOBALIS media systems.  
*It loads Bootstrap v4-alpha & jQuery v3.1.1 by default, and use GNU Make as a build tool.*

Thanks,  
[Nicolas Torres](mailto:nicolas.torres@globalis-ms.com) and [Sylvain Dubus](mailto:sylvain.dubus@globalis-ms.com)



## Getting started

```bash
make install
make watch
```

**Notes:**
- to add front-end dependencies, edit [bower.json](bower.json) and run `make install`;
- to watch without Browser-sync, use `make watch sync=false`;
- please read the [front-end guidelines](sources/README.md).



## Changelog 2016-11-16

- Replace NPM scripts build tool with Makefile
- Upgrade to Bootstrap 4
- Compile main stylesheet and Bootstrap separately
- Quit 7-1 SCSS pattern for a straightforward tree
- Merge JS dependencies into a single file
- Move `bower_components` to `sources`
- Move front-end guidelines to `sources`
