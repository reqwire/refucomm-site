var RefucommLang = RefucommLang || {};

RefucommLang.selected_lang = "";

RefucommLang.change_language = function() {
  var lang_code = $(this).data('lang');
  RefucommLang.set_language_cookie(lang_code);
  location.reload();
};

RefucommLang.set_language_cookie = function(lang_code) {
    document.cookie = "googtrans=/en/" + lang_code;
};

$(document).ready(function() {
  $('.language_selector').click( RefucommLang.change_language );
});
