$(document).ready(function(){
  $(".firstSectionButton").click(function() {
    var sectionId = $(this).attr("data_target");
    $("html, body").animate({
      scrollTop: $("#" + sectionId).offset().top
    }, 900, "swing");
  });

  $(".directingArrow").click(function() {
    var sectionId = $(this).attr("data_target");
    $("html, body").animate({
      scrollTop: $("#" + sectionId).offset().top
    }, 900, "swing");
  });

  function activateAnimation(sectionId, animationClass, triggerOffset, animationAdded) {
    $(window).scroll(function() {
      var scrollPos = $(window).scrollTop();
      var sectionOffset = $(sectionId).offset().top;
      var windowHeight = $(window).height();
      
      if (scrollPos + windowHeight > sectionOffset + triggerOffset) {
        $(sectionId).find("." + animationClass).addClass(animationAdded);
      } else {
        $(sectionId).find("." + animationClass).removeClass(animationAdded);
      }
    });
  }
  activateAnimation("#lifeJourney", "pop", 100, "animate");

  $(".owl-carousel").owlCarousel({
    loop:true,
    margin:10,
    nav:true,
    items:3,
    center: true,
    autoplay:true,
    autoplayTimeout:5000,
    autoplayHoverPause:true,
    navText: [
	    "<i class='fa fa-angle-left'></i>",
	    "<i class='fa fa-angle-right'></i>"
	],
    responsive:{
        0:{
            items:1
        },
        600:{
            items:1
        },
        1000:{
            items:3
        }
    }
  });
});