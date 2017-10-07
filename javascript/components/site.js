'use strict';

var $ = require('jQuery');

module.exports = {
	init: function() {
        this.exampleToggle();
        this.loadIframe();
	},

	exampleToggle: function() {
		$('.sg-example__toggle').on('click', function() {
			var parent = $(this).parent().parent();
			parent.find('.sg-code').toggleClass('sg-code--active');
		});
	},

    loadIframe: function() {

        function setSrc(loc) {
            var url = document.createElement('a');
            if (loc !== undefined) {
                url.href = loc;
            }
            else {
                url.href = document.location.href;
            }
            if (url.search.length) {
                url.search = url.search+'&content=1';
            }
            else {
                url.search = '?content=1';
            }
            $('#sg-iframe-content').attr('src',url.href);
        }
        // do the initial load on page load
        setSrc();
        // handle navigation clicks
        $('[data-sg-nav] a').click( function (e){
            e.preventDefault();
            console.log($(this).attr('href'));
            setSrc($(this).attr('href'));
        });

    },

};
