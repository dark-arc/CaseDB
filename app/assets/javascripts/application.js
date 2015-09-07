//= require jquery
//= require jquery_ujs
//= require select2/select2
//= require datetimepicker/jquery.datetimepicker.js
//= require jquery_nested_form
//= require_tree .

window.onload = function(){
    $('select').select2();
    $('.datepicker').datetimepicker({
	minDate:'-1800/01/01',
	maxDate:'2100/01/01',
	yearStart:'1800',
	step: 10
    });
}
