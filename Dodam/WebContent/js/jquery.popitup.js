/**
 * @name: PopItUp
 * @type: Jquery Plugin
 * @author: Sharjil Khan
 * @demo: "working on it"
 * @version: 0.0.1
 * @requires jQuery library
 */
 
(function($){

  // Plugin function
  $.fn.popitup = function(options) {

    /* defaults */
    var defaults = {
      widthSet       :  "",                      /** only integer */
      overlayColor   :  "#000",                  /** only hexcode */
      overlayOpacity :  "0.5",                   /** values between 0.1 to 1 */
      autoClose      :  false,                   /** boolean */
      animation      :  null,                    /** only slideDown, slideUp, slideLeft, slideRight */ 
      colorChange    :  {                        /** To change the background and text color of popup */
                          color      : null,
                          background : null
                        },
      chase          :  true,                   /** booleans */
      chaseSpeed     :  "500",                   /** only integer */
      fixedModal     :  false,                   /** booleans */
      modalPosition  :  [],                      /** [integer, integer] */
      containerToLoad:  "",                      /** string */
      urlToLoad      :  "",                      /** string */
      imageToLoad    :  "",                      /** string */

      /** callback methods */
      onCloseModal   :  function(){},            
      onOpenModal    :  function(){}
    }

    var opts = $.extend(true, {}, defaults, options);
    
    /* validate options */
    var regExpWidth = /^[0-9]/;
    var regExpOpacity = /^[0-1][.][0-9]$/;
    var regExpColor = /^[#][A-Fa-f0-9]/; /* only hexcode is required */

    $.each(opts, function validateOptions(key, val){

      /* widthSet */
      if( key === 'widthSet' ){
        if( val.match(regExpWidth) === null ){
          opts[key] = defaults[key];
        }
      }

      /* overlayColor */
      if( key === 'overlayColor' ){
        if( val.match(regExpColor ) === null ){
          opts[key] = defaults[key];
        }
      }

      /* overlay opacity */
      if( key == 'overlayOpacity' ){
        if( val.match(regExpOpacity) === null ){
          opts[key] = defaults[key];
        }
      }

      /* autoClose */
      if( key === 'autoClose' ){
        if( val !== true ){
          opts[key] = defaults[key];
        }
      }

      /* colorChange */

      /** IT CHECKS THE NULL VALUE... NEED TO BE FIXED */

      /*if( key === 'colorChange' ){
        if( val.color.match(regExpColor ) === "" ){
          opts[key]['color'] = defaults[key]['color'];
        }
        if( val.background.match(regExpColor ) === "" ){
          opts[key]['background'] = defaults[key]['background'];
        }
      }*/

      /* autoClose */
      if( key === 'chase' ){
        if( val !== false ){
          opts[key] = defaults[key];
        }
      }

      /* fixedModal */
      if( key === 'fixedModal' ){
        if( val !== true ){
          opts[key] = defaults[key];
        }
      }

      /* modalPosition */
      if( key === 'modalPosition' ){
        if( opts.modalPosition.length > 0 ){
          opts['chase'] = false;
        }
      }

    });

    /* open popup */
    $modal = this;
    $('body').append('<div class="popitup-overlay"></div>');
    $('.popitup-overlay').css({
      "background" : opts.overlayColor,
      "opacity"    : opts.overlayOpacity
    });

    if(opts.fixedModal){
      var $style = "fixed";
    }else{
      $style = "absolute";
    }
    $modal.css({
      "width"    :  opts.widthSet+'px',
      "position" :  $style,
      "display"  :  "block",
      "opacity"  :  "0",
      "z-index"  :  "99999",
    });

    /* loading ajax request */
    if( (opts.containerToLoad != "") ){

      if( (opts.urlToLoad != "") ){
        var request;
        if(window.XMLHttpRequest){
          request = new XMLHttpRequest();
        }
        else{
          request = new ActiveXObject("Microsoft.XMLHTTP");
        }
        request.open('GET', opts.urlToLoad);
          if( request.readyState > 0 ){
            $(opts.containerToLoad).load(opts.urlToLoad);
          }
        request.send();
      }

      if( (opts.imageToLoad != "") ){
        $(opts.containerToLoad).html("<img src='' class='popitup-img' />");
        $(".popitup-img").attr('src', opts.imageToLoad);
      }

    }

    $margin_left = $modal.outerWidth()/2;
    $margin_top  = $modal.outerHeight()/2;
    $modal.css({
      "margin-top"  : "-" + $margin_top + "px",
      "margin-left" : "-" + $margin_left + "px"
    });

    /* check for modal position */
    if( opts.modalPosition.length > 0 ){
      $modal.css({
        'top'      :   $(window).scrollTop() + opts.modalPosition[0], 
        'left'     :   opts.modalPosition[1],
        'margin'   :   0, 
        'opacity'  :  '1',
        'position' :  'absolute'
      });

    }
    else{

      switch (opts.animation)
      {
        case 'slideDown': 
          $modal.css("top","0")
          .animate({top: $(window).height() / 2 + $(window).scrollTop()+"px", opacity: "1"}, 300);
          applyModalOffset();
          break;

        case 'slideUp':
          $modal.css("bottom","0")
          .animate({top: $(window).height() / 2 + $(window).scrollTop()+"px", opacity: "1"}, 300);
          applyModalOffset();
          break;

        case 'slideLeft':
          $modal.css({"left":"0",top: $(window).height() / 2 + $(window).scrollTop()+"px"})
          .animate({ left: "50%", opacity: "1"}, 300);
          applyModalOffset();
          break;

        case 'slideRight':
          $modal.css({"right":"0",top: ( ($(window).height() + $(window).scrollTop()) / 2 ) + "px"})
          .animate({ left: "50%", opacity: "1"}, 300);
          applyModalOffset();
          break;

        default: 
          $modal.css({'top': $(window).height() / 2 + $(window).scrollTop()+"px" , 'opacity':'1'});
          applyModalOffset();
          break;
      }

    }

    opts.onOpenModal();

    function applyModalOffset(){
      $modal.css({
        "left"   :  "50%",
        "bottom" :  "",
        "right"  :  ""
      });
    }

    /* AutoClose */
    if(opts.autoClose){

      $('.popitup-overlay').bind('click', function(){

        if( opts.modalPosition.length > 0 ){

          $modal.css({'top':'','left':'','right':'','bottom':''})
          .hide();
          $('.popitup-overlay').remove();

        }
        else{

          switch (opts.animation)
          {
            case 'slideDown': 
              $modal.animate({top: "0", opacity: "0", display: "none"}, 300);
              applyModalOffset();
              setTimeout(function(){
                $modal.removeAttr("style");
              }, 300);
              break;

            case 'slideUp':
              $modal.animate({top: "100%", opacity: "0", display: "none"}, 300);
              applyModalOffset();
              setTimeout(function(){
                $modal.removeAttr("style");
              }, 300);
              break;

            case 'slideLeft':
              $modal.animate({left: "0", opacity: "0", display: "none"}, 300);
              applyModalOffset();
              setTimeout(function(){
                $modal.removeAttr("style");
              }, 300);
              break;

            case 'slideRight':
              $modal.animate({left: "100%", opacity: "0", display: "none"}, 300);
              applyModalOffset();
              setTimeout(function(){
                $modal.removeAttr("style");
              }, 300);
              break;

            default: 
              $modal.removeAttr("style")
              .hide();
              $('.popitup-overlay').remove();
              break;
          }

        }

        setTimeout(function(){
          $('.popitup-overlay').remove();
        }, 300);
        opts.onCloseModal();

      });

    }
    
    /* popup follow while scroll */
    //var posTemp = opts.modalPosition.length > 0;
    if(!opts.fixedModal ){
      if(opts.chase === true){

        var lastScrollTop = 0;
        $(window).scroll(function(event){

          var st = $(this).scrollTop();
          if (st > lastScrollTop){
            /* to bottom */
             $modal.stop().animate({"top": $(window).height() / 2 + $(window).scrollTop()+"px"}, +opts.chaseSpeed);
          } else {
            /* to top */
            $modal.stop().animate({"top": $(window).height() / 2 + $(window).scrollTop()+"px"}, +opts.chaseSpeed);
          }
          lastScrollTop = st;

        });

      }
    }

    /* Finding close button */
    $('*').each(function(){

      $varClose = $(this).hasClass('popitup-close');
      if($varClose){
        $(this).bind('click', function(){

          if( opts.modalPosition.length > 0 ){

            $modal.css({'top':'','left':'','right':'','bottom':''})
            .hide();
            $('.popitup-overlay').remove();

          }
          else{

            switch (opts.animation)
            {
              case 'slideDown': 
                $modal.animate({top: "0", opacity: "0", display: "none"}, 300);
                applyModalOffset();
                setTimeout(function(){
                  $modal.removeAttr("style");
                }, 300);
                break;

              case 'slideUp':
                $modal.animate({top: "100%", opacity: "0", display: "none"}, 300);
                applyModalOffset();
                setTimeout(function(){
                  $modal.removeAttr("style");
                }, 300);
                break;

              case 'slideLeft':
                $modal.animate({left: "0", opacity: "0", display: "none"}, 300);
                applyModalOffset();
                setTimeout(function(){
                  $modal.removeAttr("style");
                }, 300);
                break;

              case 'slideRight':
                $modal.animate({left: "100%", opacity: "0", display: "none"}, 300);
                applyModalOffset();
                setTimeout(function(){
                  $modal.removeAttr("style");
                }, 300);
                break;

              default: 
                $modal.removeAttr("style")
                .hide();
                $('.popitup-overlay').remove();
                break;
            }

          }

          setTimeout(function(){
            $('.popitup-overlay').remove();
          }, 300);
          
          opts.onCloseModal.call();

        });
      }

    });

    /* overlay color */
    if(opts.colorChange){
      $modal.css({
        "color": opts.colorChange.color,
        "background": opts.colorChange.background
      });
    }

    return $modal;
  };
  // End of Plugin function

}(jQuery));
