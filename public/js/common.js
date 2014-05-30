//Slider for banner
function slideSwitch(hover, tIndex) {
    var $active = $('#banner-list li.active');
    if ( $active.length == 0 ) $active = $('#banner-list li:last');

    // use this to pull the images in the order they appear in the markup
    var $next =  $active.next().length ? $active.next()
        : $('#banner-list li:first');
        
    if(hover) $next = $("#banner-list li:eq("+tIndex+")");
    var tabIndex = $next.index();
    $(".banner-index ul li.active").removeClass('active'); 
    $(".banner-index ul li:eq("+tabIndex+")").addClass('active');    
    $active.addClass('last-active');
    $next.css({opacity: 0.0})
        .addClass('active')
        .animate({opacity: 1.0}, 1000, function() {
            $active.removeClass('active last-active');
        });
}
//Slider for list thumb
function thumbSwitch(back, tIndex) {
    if(back){
        $move = (parseInt($('#thumb-list').css('left')) + 5*150);
        if($move >= 0) $move = -($('#thumb-list li').size()*150 - 5*150);
    }else{
        $move = (parseInt($('#thumb-list').css('left')) - 5*150);
        if(Math.abs($move) >= ($('#thumb-list li').size()*150)) $move = 0;
    }
    
    $('#thumb-list').animate({left: $move},1000);

}

//Slider for list pro thumb
function thumbProSwitch(back, tIndex) {
    if(back){
        $move = (parseInt($('#thumb-pro-list').css('left')) + 100);
        if($move >= 0) $move = -($('#thumb-pro-list li').size()*100 - 100);
    }else{
        $move = (parseInt($('#thumb-pro-list').css('left')) - 100);
        if(Math.abs($move) >= ($('#thumb-pro-list li').size()*100)) $move = 0;
    }
    
    $('#thumb-pro-list').animate({left: $move},1000);

}
//convert number
Number.prototype.formatMoney = function(c, d, t){
var n = this, 
    c = isNaN(c = Math.abs(c)) ? 2 : c, 
    d = d == undefined ? "." : d, 
    t = t == undefined ? "," : t, 
    s = n < 0 ? "-" : "", 
    i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "", 
    j = (j = i.length) > 3 ? j % 3 : 0;
   return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
 };