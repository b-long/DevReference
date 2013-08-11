// to depend on a bower installed component:
// define(['component/componentName/file'])

define(["jquery"], function($) {
  $('body').append('jQuery ' + $.fn.jquery + ' loaded!');
  
	$(document).ready(function(){
		
		$('#devreference-main').css({
			height: '200px',
			width: '200px',
			backgroundColor: 'green'
		});

	});

});
