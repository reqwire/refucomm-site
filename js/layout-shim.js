var Refucomm = Refucomm || {};

Refucomm.header_wrap = function() {
    // Sets the icon beside the H2 in the infopack pages
    // Otherwise it sits above on narrow devices
    body_width = $('.col-md-12').width();
    header_width = body_width - 40;
    $('.infopack h2').width(header_width);
};


Refucomm.show_pdf_languages = function() {
    $('.pdf_name').click(function() {
        $(this).parents('li').children('ul').toggle();
    });
};

$(document).ready(function() {
    Refucomm.header_wrap();
    Refucomm.show_pdf_languages();
});
