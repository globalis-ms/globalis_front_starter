(function($) {

    console.log('Main.js loaded');


    // global tools
    $('[data-confirm]').on('click', function() {
		return confirm($(this).data('confirm'));
	});


    // plugins & components initializations
    /*
    var component = new Component({
        // options
        // …
    });

    $('[data-example]').Plugin({
        // options
        // …
    });
    */


    // interactions between components
    // …

})(jQuery);
