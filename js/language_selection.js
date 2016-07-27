var RefucommLang = RefucommLang || {};

RefucommLang.selected_lang = "";

RefucommLang.filter_on_click = function() {
  $('.language_filter').click(function() {
    var selected = $(this);
    RefucommLang.show_active_language_choice(selected);
    RefucommLang.filter_by_language(selected);
    return false;
  });
};

RefucommLang.show_active_language_choice = function(selected) {
    $('#language_filter li').removeClass('active');
    selected.parent().addClass('active');
};

RefucommLang.hide_non_selected_language_choice = function() {
    if (RefucommLang.selected_lang == "all") {
        $(this).show();
    }
    else {
        var langs_list = $(this).data('langs').split(',');
        if ( langs_list.indexOf(RefucommLang.selected_lang) >=0 ) {
            $(this).show();
        }
        else {
            $(this).hide();
        }
    }
};

RefucommLang.filter_by_language = function(selected) {
    var language_choice = selected.attr('href').substring(1);
    RefucommLang.selected_lang = language_choice;
    $('[data-langs]').each(RefucommLang.hide_non_selected_language_choice);
};


$(document).ready(function() {
  RefucommLang.filter_on_click();
});
