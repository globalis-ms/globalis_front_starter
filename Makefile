# Build tools
# Read: http://west.io/post/2015/04/11-frontend-builds-with-makefiles/
.PHONY: all watch install vendor


# Watch
# NOTE On OSX, overwrite watch native command:
# brew install watch
# brew info watch # read watch path
# sudo mv <path_to_watch>/bin/watch /usr/local/bin
all: public/css/bootstrap.css public/css/main.css public/js/main.js
url="http://localhost"
port=3000
sync=true
watch:
ifeq ($(sync), true)
	@ browser-sync start -p $(url) --port $(port) --files "index.html" "public" --no-open &> /dev/null | watch -n 1 make all
else
	@ watch -n 1 make all
endif


# Concat & minify styles & scripts
public/css/bootstrap.css: sources/scss/_variables.scss
	@ node-sass --output-style=compressed sources/scss/bootstrap.scss -o public/css/ --source-map public/css/

public/css/main.css: sources/scss/*.scss
	@ node-sass --output-style=compressed sources/scss/main.scss -o public/css/ --source-map public/css/

public/js/main.js: sources/js/*.js
	@ uglifyjs sources/js/*.js -o public/js/main.js --source-map public/js/main.js.map -p relative

vendor:
	@ uglifyjs $$(bower-files js) -o public/js/vendor.js --source-map public/js/vendor.js.map -p relative



# Install dependencies
install:
	@ echo "› Checking NPM dependencies:"
	@ hash node-sass 2>/dev/null || (echo "› Installing node-sass…" && sudo npm i -g node-sass)
	@ hash riot 2>/dev/null || (echo "› Installing Riot…" && sudo npm i -g riot)
	@ hash uglifyjs 2>/dev/null || (echo "› Installing UglifyJS…" && sudo npm i -g uglify-js)
	@ hash bower 2>/dev/null || (echo "› Installing Bower…" && sudo npm i -g bower)
	@ hash bower-files 2>/dev/null || (echo "› Installing Bower-files…" && sudo npm i -g bower-files)
	@ hash browser-sync 2>/dev/null || (echo "› Installing Browser-sync…" && sudo npm i -g browser-sync)
	@ echo "› Done. Installing frond-end dependencies:"
	@ bower install --allow-root
	@ make vendor
	@ echo "› Installation done, start with \"make watch\"."
