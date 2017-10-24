/*
 * git; https://github.com/rivalex/BootstrapStrength.js
 * bootstrap-strength.js
 * Original author: @rivalex
 * Further changes, comments: @rivalex
 * Licensed under the MIT license
 */
;(function(window, $, undefined) {
	
	"use strict";
	
	$.bootstrapStrength = function bootstrapStrength(options,element) {
		this.element		= element;
		this.$elem			= $(this.element);
		this.options		= $.extend({}, $.bootstrapStrength.defaults, options);
		var _self	 		= this;
		_self._init();
	}
	
	$.bootstrapStrength.defaults = {
		stripped: true,
		active: true,
		slimBar: false,
		minLenght: 8,
		upperCase: 1,
		upperReg: "[A-Z]",
		lowerCase: 1,
		lowerReg: "[a-z]",
		numbers: 1,
		numberReg: "[0-9]",
		specialchars: 1,
		specialReg: "[!,%,&,@,#,$,^,*,?,_,~]",
		topMargin: "5px;",
		meterClasses: {
			weak: "progress-bar-danger",
			medium: "progress-bar-warning",
			good: "progress-bar-success"
		}
	};
	
	$.bootstrapStrength.prototype = {
		
		_init: function() {
			
			var _self			= this,
				options			= _self.options,
				progressClass	= options.meterClasses,
				element			= _self.$elem,
				elementID		= element.attr('id'),
				stringLenght = 0,
				capitals = 0,
				lowers = 0,
				numbers = 0,
				special = 0,
				progress,
				progressbar;
			
			function calcPercentage(full, partial) {
				return ((partial / full) * 100).toFixed(0);
			}
			
			function matchString(string, range, limit) {
				var searchPattern, rx;
				searchPattern = "(.*" + range + ".*){" + limit + ",}";
				rx = new RegExp( searchPattern, "g" );
				return (string.match(rx))?1:0;
			}
			
			function check_strength(string, elementID){
				stringLenght = (string.length >= options.minLenght)?1:0;
				capitals = (options.upperCase > 0) ? matchString(string, options.upperReg, options.upperCase) : 1;
				lowers = (options.lowerCase > 0) ? matchString(string, options.lowerReg, options.lowerCase) : 1;
				numbers = (options.numbers > 0) ? matchString(string, options.numberReg, options.numbers) : 1;
				special = (options.specialchars > 0) ? matchString(string, options.specialReg, options.specialchars) : 1;
				var totalpercent = calcPercentage(5, (stringLenght + capitals + lowers + numbers + special));
				displayStrenght(totalpercent,elementID);
			}
			
			function displayStrenght(total, elementID){
				var meter = $('div[data-meter="'+elementID+'"]'),
					meterClass;
				switch(parseInt(total)) {
					case 0: meterClass = progressClass.weak; break;
					case 20: meterClass = progressClass.weak; break;
					case 40: meterClass = progressClass.weak; break;
					case 60: meterClass = progressClass.medium; break;
					case 80: meterClass = progressClass.medium; break;
					case 100: meterClass = progressClass.good; break;
				}
				meter.removeClass(progressClass.weak + " " + progressClass.medium + " " + progressClass.good).attr("aria-valuenow",total).width(total + "%").addClass(meterClass);
			}
			
			progress = $("<div/>", {
				class: "progress",
				style: "margin-top:" + options.topMargin + ((options.slimBar) ? "height: 7px;border-radius: 7px" : "")
			})
			progressbar = $("<div/>", {
				class: "progress-bar" + ((options.stripped)?" progress-bar-striped":"") + ((options.active)?" active":""),
				role: "progressbar",
				"data-meter": elementID,
				"aria-valuenow": 0,
				"aria-valuemin": 0,
				"aria-valuemax": 100
			}).appendTo(progress);
			
			if(this.$elem.parent().hasClass("input-group")) {
				this.$elem.parent().after(progress);
			} else {
				this.$elem.after(progress);
			}
			 
			this.$elem.bind('keyup keydown', function(e) {
				var thisString = $('#'+elementID).val();
				check_strength(thisString,elementID);
			});
		}
	};

	$.fn.bootstrapStrength = function (options) {
		if ($.data(this, "bootstrapStrength")) return;
		return $(this).each(function() {
			$.data(this, "bootstrapStrength",new $.bootstrapStrength(options, this));
		})
	}
})(window, jQuery);