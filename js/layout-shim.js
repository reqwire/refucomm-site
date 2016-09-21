var Refucomm = Refucomm || {};

Refucomm.top_nav_shim = function() {
    var top_pad = 0;
    $('.navbar-fixed-top').each(function() {
        $(this).css('top', top_pad + "px");
        top_pad = top_pad + $(this).height();
    });
    $('body').css('padding-top', top_pad + "px");
};

Refucomm.header_wrap = function() {
    body_width = $('.col-md-12').width();
    header_width = body_width - 40;
    $('.infopack h2').width(header_width);
};

Refucomm.navbar_fix_on_scroll = function() {
    var lang_height = $('.full_translation').height() + 38,
        scroll_amount = $(document).scrollTop();

    if ( scroll_amount > lang_height) {
        $("#navbar-flex-fix").addClass('navbar-fixed-top');
    }
    else {
        $("#navbar-flex-fix").removeClass('navbar-fixed-top');
    }
};

Refucomm.show_pdf_languages = function() {
    $('.pdf_name').click(function() {
        $(this).parents('li').children('ul').toggle();
    });
};

$(document).ready(function() {
    Refucomm.top_nav_shim();
    Refucomm.header_wrap();
    $(window).scroll(Refucomm.navbar_fix_on_scroll);
    Refucomm.show_pdf_languages();
});
