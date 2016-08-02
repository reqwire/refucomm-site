var Refucomm = Refucomm || {};

Refucomm.record_document_get = function() {
    var href = $(this).attr('href'),
        document_name = $(this).data('documentname'),
        language = $(this).data('langs');
    ga("send", "event", "infopack", "download", document_name, language);
    ga("send", "event", "infopack", "translate", language);
};

$(document).ready(function() {
  $('.document_list a').click( Refucomm.record_document_get );
});
