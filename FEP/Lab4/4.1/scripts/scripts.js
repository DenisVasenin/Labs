// глобальные переменные

//var navbar_offset = $(".header_navigation_bar").offset();                      // координаты header navigation bar относительно окна браузера

//$(window).resize(function() {
//  alert($(".main").width());
//});

$(document).scroll(function() {

  if ($("#page_wrapper").width() > 1100) {
    
    if ($(window).scrollTop() > 1) {
      $(".header_navigation_bar").animate(
        { "top": 0 }, { duration: 1, queue: false });
    } else {
      $(".header_navigation_bar").animate(
        { "top": 42 }, { duration: 1, queue: false });
    }
    
    if ($(window).scrollTop() >= 42) {
      $(".header_navigation_menu_button").css("border-width","0px 1px 0px 1px");
      $(".header_navigation_bar").css("position","fixed");
      $(".header_navigation_bar").animate({ "height": 50, "padding-top": 0, "padding-bottom": 0 }, { duration: 60, queue: false });
      $(".site_logo").animate({ "height": 20 }, { duration: 60, queue: false });
    } else {
      $(".header_navigation_menu_button").css("border-width","1px 1px 0px 1px");
      $(".header_navigation_bar").css("position","static");
      $(".header_navigation_bar").animate({ "height": 112, "padding-top": 30, "padding-bottom": 30 }, { duration: 60, queue: false });
      $(".site_logo").animate({ "height": 40 }, { duration: 60, queue: false });
    }
  }

  // скрыть/показать кнопку scroll_up
  if ($(window).scrollTop() > 800) {
    $(".scroll_up_button").fadeTo(10, 0.5)
  } else {
    $(".scroll_up_button").fadeTo(10, 0)
  }
});

// скрытие\показ кнопок карусели
$("#carousel_1").hover(
  function() {
    $(".owl-nav, .owl-dots").animate(
      {
        "opacity": 1,
        "bottom": 20,
      },
      { duration: 600, queue: false });
  },
  function() {
    $(".owl-nav, .owl-dots").animate(
      {
        "opacity": 0,
        "bottom": 0,
      },
      { duration: 600, queue: false}
    );
});
