// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$('#new_owner').live('ajax:before', function() {
	$('#owner_spinner').show();
});
$('#new_member').live('ajax:before', function() {
	$('#member_spinner').show();
});
										
$('.listing > td.attribute').live('click', function() {
	document.location = $(this).parent().attr('data-href');
})