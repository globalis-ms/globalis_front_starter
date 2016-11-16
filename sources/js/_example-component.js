/*
(function() {

	// local helpers
	var localHelper = function() {};

	// component
	var Component = function(options) {

		// singleton pattern
		// NOTE remove if you need multiple instances
		if (arguments.callee._singletonInstance)
			return arguments.callee._singletonInstance;
		arguments.callee._singletonInstance = this;

		// settings
		var settings = jQuery.extend({
			// key: default value,
			// …
		}, options);

		// methods & properties definitions
		// …

		// initialization
		// …

		// internal interactions
		// …

	};

	// make sure only the component goes global
	window.Component = Component;

})();
*/
