var Refucomm = Refucomm || {};

Refucomm.record_document_get = function() {
    var href = $(this).attr('href'),
        document_name = $(this).data('documentname'),
        language = $(this).data('langs');
    ga("send", "event", "infopack", "download", document_name, language);
    ga("send", "event", "infopack", "translate", language);
};

Refucomm.record_link_click = function() {
    var link_name = $(this).data('linkname');
    ga("send", "event", "infopack", "link", link_name);
};

$(document).ready(function() {
  $('.document_list .language_list a').click( Refucomm.record_document_get );
  $('.link_list_item a').click( Refucomm.record_link_click );
});
