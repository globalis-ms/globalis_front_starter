# Build tools
# Read: http://west.io/post/2015/04/11-frontend-builds-with-makefiles/
.PHONY: all watch install


# Watch
# NOTE On OSX, overwrite watch native command:
# brew install watch
# brew info watch # read watch path
# sudo mv <path_to_watch>/bin/watch /usr/local/bin
all: public/css/bootstrap.css public/css/main.css public/js/vendor.js public/js/main.js

host = "http://localhost"
port = 3000
sync = true
watch:
ifeq ($(sync), true)
	@ browser-sync start -p $(host) --port $(port) --files "index.html" "public" --no-open &> /dev/null | \
	watch -t -n 1 "make all && echo '-- Browser-sync listening on $(host):$(port)'"
else
	@ watch -t -n 1 make all
endif


# Concat & minify styles & scripts
public/css/bootstrap.css: sources/scss/_variables.scss
	@ node-sass --output-style=compressed sources/scss/bootstrap.scss -o public/css/ --source-map public/css/
	@ echo "› $@ has been updated"

public/css/main.css: sources/scss/*.scss
	@ node-sass --output-style=compressed sources/scss/main.scss -o public/css/ --source-map public/css/
	@ echo "› $@ has been updated"

public/js/main.js: sources/js/*.js
	@ uglifyjs sources/js/*.js -o public/js/main.js --source-map public/js/main.js.map -p relative
	@ echo "› $@ has been updated"

VENDOR = $(shell bower-files js)
public/js/vendor.js: $(VENDOR)
	@ uglifyjs $(VENDOR) -o public/js/vendor.js --source-map public/js/vendor.js.map -p relative
	@ echo "› $@ has been updated"



# Install dependencies
PACKAGES = "node-sass uglifyjs bower bower-files browser-sync"
install:
	@ echo "› Checking NPM dependencies:"
	@ for name in "$(PACKAGES)"; do hash $$name 2>/dev/null || (echo "-- Installing $$name" && sudo npm install -g $$name); done
	@ echo "› Done. Installing frond-end dependencies:"
	@ bower install --allow-root
	@ echo "› Installation done, start with \"make watch\"."
