var Refucomm = Refucomm || {};

Refucomm.top_nav_shim = function() {
    var top_pad = 0;
    $('.navbar-fixed-top').each(function() {
        $(this).css('top', top_pad + "px");
        top_pad = top_pad + $(this).height();
    });
    top_pad = top_pad + 50; // once more to fix landscape mobile
    $('body').css('padding-top', top_pad + "px");
};

Refucomm.header_wrap = function() {
    body_width = $('.col-md-12').width();
    header_width = body_width - 40;
    $('.infopack h2').width(header_width);
};

$(document).ready(function() {
    Refucomm.top_nav_shim();
    Refucomm.header_wrap();
});
