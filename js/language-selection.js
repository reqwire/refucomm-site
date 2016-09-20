var RefucommLang = RefucommLang || {};

RefucommLang.change_language = function() {
  var lang_code = $(this).data('lang');
  RefucommLang.set_language_cookie(lang_code);
  RefucommLang.record_language_event(lang_code);
  location.reload();
};

RefucommLang.record_language_event = function(lang) {
    ga("send", "event", "website_navigation", "translate", lang);
};

RefucommLang.set_language_cookie = function(lang_code) {
    document.cookie = "googtrans=/en/" + lang_code + "; expires=; domain=" + window.location.hostname + "; path=/";
    document.cookie = "googtrans=/en/" + lang_code + "; expires=; path=/";
};

$(document).ready(function() {
  $('.language_selector').click( RefucommLang.change_language );
});
