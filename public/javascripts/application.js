// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$('#extra_addresses li a[data-method="delete"]').live('ajax:before', 
										function() {
											$(this).parent().fadeOut();
											$('#spinner').show();
										}
									);

$('#extra_addresses li a[data-method="delete"]').live('ajax:complete', 
										function() {
											$('#spinner').hide();
										}
									);


$('#new_member').live('ajax:before', 
										function() {
											$('#spinner').show();
										}
									);