$(document).ready(function() {
  $("#carousel_1").owlCarousel({

    // Most important owl features
    items: 1,
    loop: true,
    
    // Navigation
    nav: true,
    rewind: true,
    //navigationText: ["<img src=\"images/owlcarousel/arrow_left.png\">","<img src=\"images/owlcarousel/arrow_right.png\">"],
    navText: ["",""],
    
    // Autoplay
    autoPlay : true,
    stopOnHover : true,
    //autoplayTimeout:2000, //Время смены слайда
    
    smartSpeed: 1000,

    responsive: false
  });

  $("#carousel_2").owlCarousel({

    // Most important owl features
    margin:30,
    loop: true,
    
    // Navigation
    nav: true,
    rewind: true,
    //navigationText: ["<img src=\"images/owlcarousel/arrow_left.png\">","<img src=\"images/owlcarousel/arrow_right.png\">"],
    navText: ["",""],
    
    // Autoplay
    autoPlay : true,
    stopOnHover : true,
    //autoplayTimeout:2000, //Время смены слайда
    
    smartSpeed: 1000,

    responsive: {
      0: { items: 1 },
      500: { items: 2 },
      600: { items: 3 },
      1000: { items: 4 }
    }
  });
});

/*
items                 Type:Number            The number of items you want to see on the screen.
margin                Type:Number            margin-right(px) on item.
loop                  Type:Boolean           Infinity loop. Duplicate last and first items to get loop illusion.
center                Type:Boolean           Center item. Works well with even an odd number of items.
mouseDrag             Type:Boolean           Mouse drag enabled.
touchDrag             Type:Boolean           Touch drag enabled.
pullDrag              Type: Boolean          Stage pull to edge.
freeDrag              Type: Boolean          Item pull to edge.
stagePadding          Type: Number           Padding left and right on stage (can see neighbours).
merge                 Type: Boolean          Merge items. Looking for data-merge='{number}' inside item..
mergeFit              Type: Boolean          Fit merged items if screen is smaller than items value.
autoWidth             Type: Boolean          Set non grid content. Try using width style on divs.
startPosition         Type: Number/String    Start position or URL Hash string like '#id'.
URLhashListener       Type: Boolean          Listen to url hash changes. data-hash on items is required.
nav                   Type: Boolean          Show next/prev buttons.
rewind                Type: Boolean          Go backwards when the boundary has reached.
navText               Type: Array            Default: [&#x27;next&#x27;,&#x27;prev&#x27;] HTML allowed.
navElement            Type: String           DOM element type for a single directional navigation link.
slideBy               Type: Number/String    Navigation slide by x. 'page' string can be set to slide by page.
dots                  Type: Boolean          Show dots navigation.
dotsEach              Type: Number/Boolean   Show dots each x item.
dotData               Type: Boolean          Used by data-dot content.
lazyLoad              Type: Boolean          Lazy load images. data-src and data-src-retina for highres. Also load images into background inline style if element is not <img>
lazyContent           Type: Boolean          lazyContent was introduced during beta tests but i removed it from the final release due to bad implementation. It is a nice options so i will work on it in the nearest feature.

autoplay              Type: Boolean          Autoplay.
autoplayTimeout       Type: Number           Autoplay interval timeout.
autoplayHoverPause    Type: Boolean          Pause on mouse hover.
smartSpeed            Type: Number           Speed Calculate. More info to come..
fluidSpeed            Type: Boolean          Speed Calculate. More info to come..
autoplaySpeed         Type: Number/Boolean   autoplay speed.
navSpeed              Type: Number/Boolean   Navigation speed.
dotsSpeed             Type: Boolean          Pagination speed.
dragEndSpeed          Type: Number/Boolean   Drag end speed.
callbacks             Type: Boolean          Enable callback events.
responsive            Type: Object           Object containing responsive options. Can be set to false to remove responsive capabilities.
responsiveRefreshRate Type: Number           Responsive refresh rate.
responsiveBaseElement Type: DOM element      Set on any DOM element. If you care about non responsive browser (like ie8) then use it on main wrapper. This will prevent from crazy resizing.
video                 Type: Boolean          Enable fetching YouTube/Vimeo/Vzaar videos.
videoHeight

Type: Number/Boolean
Default: false

Set height for videos.
videoWidth

Type: Number/Boolean
Default: false

Set width for videos.
animateOut

Type: String/Boolean
Default: false

Class for CSS3 animation out.
animateIn

Type: String/Boolean
Default: false

Class for CSS3 animation in.
fallbackEasing

Type: String
Default: swing

Easing for CSS2 $.animate.
info

Type: Function
Default: false

Callback to retrieve basic information (current item/pages/widths). Info function second parameter is Owl DOM object reference.
nestedItemSelector

Type: String/Class
Default: false

Use it if owl items are deep nested inside some generated content. E.g 'youritem'. Dont use dot before class name.
itemElement

Type: String
Default: div

DOM element type for owl-item.
stageElement

Type: String
Default: div

DOM element type for owl-stage.
navContainer

Type: String/Class/ID/Boolean
Default: false

Set your own container for nav.
dotsContainer

Type: String/Class/ID/Boolean
Default: false

Set your own container for nav.
*/
