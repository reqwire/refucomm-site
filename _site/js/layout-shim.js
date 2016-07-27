var Refucomm = Refucomm || {};

Refucomm.top_nav_shim = function() {
    var top_pad = 0;
    $('.navbar-fixed-top').each(function() {
        $(this).css('top', top_pad + "px");
        top_pad = top_pad + $(this).height();
    });
    $('body').css('padding-top', top_pad + "px");
};

$(document).ready(function() {
  Refucomm.top_nav_shim();
});
