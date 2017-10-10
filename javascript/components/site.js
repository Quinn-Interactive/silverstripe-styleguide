'use strict';

var $ = require('jQuery');

module.exports = {
	init: function() {
        this.exampleToggle();
        this.loadIframe();
	},

	exampleToggle: function() {
		$('.sg-example__toggle').click(function() {
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

            // update the active states of the nav
            const pathname = url.pathname + url.hash;
            const fullurl = document.location.protocol + '//' + document.location.host + pathname;
            $('[data-sg-nav] a').removeClass('active');
            $('[data-sg-nav] a[href="'+pathname+'"]').addClass('active');
            $('[data-sg-nav] a[href="'+pathname+'"]').parent().addClass('open');


            // update the browser url
            history.pushState(null, null, fullurl);
        }
        // do the initial load on page load
        setSrc();
        // handle navigation clicks
        $('[data-sg-nav] a').click( function (e){
            e.preventDefault();
            setSrc($(this).attr('href'));
            // set open/closeness if we are clicking on a sg-nav-section-item
            if ($(this).parent().hasClass('sg-nav-section-item')) {
                $(this).parent().addClass('open');
                $('.sg-nav-section-item').not($(this).parent()).removeClass('open');
            }

        });

    },

};
