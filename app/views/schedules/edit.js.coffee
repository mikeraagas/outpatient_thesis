$("#EditSched").modal "show"
$("#EditSched").html "<%= escape_javascript( render(:partial => 'form'))%>"
$(".datepicker").datepicker "update"
$(".datepicker").datepicker "remove"
$(".datepicker").datepicker
  format: "yyyy-mm-dd"