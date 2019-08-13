'use strict';

var $ = require('jQuery');

module.exports = {
	init: function() {
        this.exampleToggle();
        this.sourceToggle();
        this.loadIframe();
        this.menuToggle();
        this.frameWidth();
        var self = this;
        $(window).resize( function (){
            self.frameWidth();
        });
	},

    exampleToggle: function() {
		$('.sg-example__toggle').click(function() {
			var parent = $(this).closest('.sg-example-wrapper');
			parent.find('.sg-code').toggleClass('sg-code--active');
		});
	},

    sourceToggle: function() {
		$('.sg-source__toggle').click(function() {
            var $btn = $(this);
            var $parent = $(this).closest('.sg-container');
            var $source = $parent.find('.sg-source');
            var activeClass = 'sg-source--active';
            if ($source.hasClass(activeClass)) {
                $source.removeClass(activeClass);
                $btn.text('View CSS');
            }
            else {
                $source.addClass(activeClass);
                $btn.text('Hide CSS');
            }
		});
	},

    menuToggle: function() {
		$('[data-sg-menu-toggle]').click(function(e) {
            e.preventDefault();
			var $menu = $('[data-sg-panel-navigation]', window.parent.document),
                $button = $(this);
            $menu.toggle(0,'swing',function () {
                if ($menu.is(':hidden')) {
                    $('body', window.parent.document).addClass('sg-menu-is-hidden');
                    $('body', window.parent.document).removeClass('sg-menu-is-open');
                }
                else {
                    $('body', window.parent.document).addClass('sg-menu-is-open');
                    $('body', window.parent.document).removeClass('sg-menu-is-hidden');
                }
            });
            $(window).resize();
		});
	},

    frameWidth: function () {
        var frame_width = $('#sg-iframe-content', window.parent.document).width();
        $('[data-sg-width]').text(frame_width + 'px wide');
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
        $('[data-sg-nav-link]').click( function (e){
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
