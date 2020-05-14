function send_mail() {
	window.location.href =
		"mailto:lls4656@aol.com?subject=" +
		encodeURI(document.getElementById("subject_field").value) +
		"&body=" +
		encodeURI(document.getElementById("message_field").value);
	return false;
}

if ($(".scroll-to-target").length) {
	$(".scroll-to-target").click("click", function() {
		var target = $(this).attr("data-target");
		// animate
		$("html, body").animate(
			{
				scrollTop: $(target).offset().top
			},
			1000
		);
	});
}

$(document).ready(function() {
	// Partner slider
	$("#partner-slider").owlCarousel({
		loop: true,
		margin: 10,
		autoplay: true,
		responsive: {
			0: {
				items: 1
			},
			600: {
				items: 3
			},
			1000: {
				items: 4
			}
		}
	}); // end of #partner-slider

	if ($(".scroll-to-target").length) {
		$(".scroll-to-target").click("click", function() {
			var target = $(this).attr("data-target");
			// animate
			$("html, body").animate(
				{
					scrollTop: $(target).offset().top
				},
				1000
			);
		});
	}

	// Turn off Google Map zooming
	$(".map_canvas").addClass("scrolloff"); // set the pointer events to none on doc ready
	$("#map").on("click", function() {
		$(".map_canvas").removeClass("scrolloff"); // set the pointer events true on click
	});
	// you want to disable pointer events when the mouse leave the canvas area;
	$(".map_canvas").mouseleave(function() {
		$(".map_canvas").addClass("scrolloff"); // set the pointer events to none when mouse leaves the map area
	}); //end of Turn off Google Map zooming

	// Team box height
	var h = $(".team-img-detail").height();
	var mbottom = h;
	h = h / 2;
	var top = $(".team-box").height();
	top = top / 2 - h;
	var win = $(window).width();

	if (win >= 768) {
		$(".team-img-detail").css("top", top);
	} else {
		$(".team-img-detail").css({
			bottom: -mbottom + 20,
			left: "0",
			width: "100%"
		});
		$(".team-box").css("margin-bottom", mbottom + 30);
	} // end of Team box height

	// Pop up
	$(".test-popup-link").magnificPopup({
		type: "image",
		gallery: {
			enabled: true
		},
		zoom: {
			enabled: true,
			duration: 300,
			easing: "ease-in-out",
			opener: function(openerElement) {
				return openerElement.is("img")
					? openerElement
					: openerElement.find("img");
			}
		}
	}); //end of Pop Up
}); // end of $(document).ready(function()

jQuery(function($) {
	"use strict";
	/* ----------------------------------------------------------- */
	/*  Mobile Menu
	/* ----------------------------------------------------------- */
	jQuery(".nav.navbar-nav li a").on("click", function() {
		jQuery(this)
			.parent("li")
			.find(".dropdown-menu")
			.slideToggle();
		jQuery(this)
			.find("li i")
			.toggleClass("fa-angle-down fa-angle-up");
	});

	if ($(".wow").length) {
		var wow = new WOW({
			boxClass: "wow", // animated element css class (default is wow)
			animateClass: "animated", // animation css class (default is animated)
			offset: 0, // distance to the element when triggering the animation (default is 0)
			mobile: false, // trigger animations on mobile devices (default is true)
			live: true // act on asynchronously loaded content (default is true)
		});
		wow.init();
	}

	/* ----------------------------------------------------------- */
	/*  Site search
	/* ----------------------------------------------------------- */

	/* ----------------------------------------------------------- */
	/*  Scroll To Top
	/* ----------------------------------------------------------- */
	$(window).scroll(function() {
		if ($(this).scrollTop() > 500) {
			$(".scroll-to-top").fadeIn();
		} else {
			$(".scroll-to-top").fadeOut();
		}
	});

	// scroll body to 0px on click
	$(".scroll-to-top").on("click", function() {
		$("body,html").animate(
			{
				scrollTop: 0
			},
			500
		);
		return false;
	});
});
