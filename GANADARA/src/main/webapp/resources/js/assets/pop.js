/*
	Full Motion by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
*/

(function($) {
	
	/* 배너 이미지 바꾸기 */ 
	if($("#edu_grade").val() == '초급'){
		$("#banner").css('background-image','url("../dara/resources/img/assets/start01_banner.png"');	
	} else if($("#edu_grade").val() == '중급'){
		$("#banner").css('background-image','url("../dara/resources/img/assets/start02_banner.png"');
	}
	
	/* poptrox 이벤트 방지 */
	$('.style2').click(function(){
		location.href = 'eduword_demo.do';
		return false;
	});
	$('.style3').click(function(){
		location.href = 'eduspeak_demo.do';
		return false;
	});
	
	var	$window = $(window),
		$banner = $('#banner'),
		$body = $('#top');
		
	// Breakpoints.
		skel.breakpoints({
			default:   ['1681px',   null       ],
			xlarge:    ['1281px',   '1680px'   ],
			large:     ['981px',    '1280px'   ],
			medium:    ['737px',    '980px'    ],
			small:     ['481px',    '736px'    ],
			xsmall:    ['361px',    '480px'    ],
			xxsmall:   [null,       '360px'    ]
		});

	// Play initial animations on page load.
		$window.on('load', function() {
			window.setTimeout(function() {
				$body.removeClass('is-preload');
			}, 100);
		});	
	
	$('#menu')
			.append('<a href="#menu" class="close"></a>')
			.appendTo($body)
			.panel({
				target: $body,
				visibleClass: 'is-menu-visible',
				delay: 500,
				hideOnClick: true,
				hideOnSwipe: true,
				resetScroll: true,
				resetForms: true,
				side: 'right'
			});

	skel.breakpoints({
		xlarge:	'(max-width: 1680px)',
		large:	'(max-width: 1280px)',
		medium:	'(max-width: 980px)',
		small:	'(max-width: 736px)',
		xsmall:	'(max-width: 480px)'
	});

	$(function() {

		var $window = $(window),
			$body = $('body');

		// Disable animations/transitions until the page has loaded.
			$body.addClass('is-loading');

			$window.on('load', function() {
				window.setTimeout(function() {
					$body.removeClass('is-loading');
				}, 100);
			});

		// Fix: Placeholder polyfill.
			$('form').placeholder();

		// Banner.
			var $banner = $('#banner');

			if ($banner.length > 0) {

				// IE fix.
					if (skel.vars.IEVersion < 12) {

						$window.on('resize', function() {

							var wh = $window.height() * 0.60,
								bh = $banner.height();

							$banner.css('height', 'auto');

							window.setTimeout(function() {

								if (bh < wh)
									$banner.css('height', wh + 'px');

							}, 0);

						});

						$window.on('load', function() {
							$window.triggerHandler('resize');
						});

					}

				// Video check.
					var video = $banner.data('video');

					if (video)
						$window.on('load.banner', function() {

							// Disable banner load event (so it doesn't fire again).
								$window.off('load.banner');

							// Append video if supported.
								if (!skel.vars.mobile
								&&	!skel.breakpoint('large').active
								&&	skel.vars.IEVersion > 9)
									$banner.append('<video autoplay loop><source src="' + video + '.mp4" type="video/mp4" /><source src="' + video + '.webm" type="video/webm" /></video>');

						});

				// More button.
					$banner.find('.more')
						.addClass('scrolly');

			}

		// Scrolly.
			$('.scrolly').scrolly();

		// Poptrox.
			$window.on('load', function() {

				var $thumbs = $('.thumbnails');
				var $button = $('.fit');

				if ($thumbs.length > 0)
				
						$thumbs.poptrox({
							onPopupClose: function() { $body.removeClass('is-covered'); },
							onPopupOpen: function() { $body.addClass('is-covered'); },
							baseZIndex: 10001,
							useBodyOverflow: false,
							overlayColor: '#222226',
							overlayOpacity: 0.75,
							popupLoaderText: '',
							fadeSpeed: 500,
							usePopupDefaultStyling: false,
							windowMargin: (skel.breakpoint('small').active ? 5 : 50)
						});
				

			});

		// Initial scroll.
			$window.on('load', function() {
				$window.trigger('scroll');
			});

	});

})(jQuery);