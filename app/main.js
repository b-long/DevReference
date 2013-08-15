/*global console*/

// to depend on a bower installed component:
// define(['component/componentName/file'])

define(["jquery"], function($) {
  
	$(document).ready(function(){
		/*
		TODO: Move this to a unit test.  
		// Confirms that jQuery can manipulate the DOM at this point
		$('#devreference-main').css({
			height: '200px',
			width: '200px',
			backgroundColor: 'green'
		});
		*/
		var psuedoIndex = '' +
// TODO: Create this programmatically
// Start the list
'<ul id="files">' +
'<li><a href="/developer-reference/docs/MyShellStuff.sh" class="" title="MyShellStuff.sh">MyShellStuff.sh</a></li>' +
'<li><a href="/developer-reference/docs/emacs_REFERENCE.md" class="" title="emacs_REFERENCE.md">emacs_REFERENCE.md</a></li>' +
'<li><a href="/developer-reference/docs/git_REFERENCE.md" class="" title="git_REFERENCE.md">git_REFERENCE.md</a></li>' +
'<li><a href="/developer-reference/docs/oracle_REFERENCE.md" class="" title="oracle_REFERENCE.md">oracle_REFERENCE.md</a></li>' +
'<li><a href="/developer-reference/docs/rpm_REFERENCE.md" class="" title="rpm_REFERENCE.md">rpm_REFERENCE.md</a></li>' +
'<li><a href="/developer-reference/docs/rsync_REFERENCE.md" class="" title="rsync_REFERENCE.md">rsync_REFERENCE.md</a></li>' +
'<li><a href="/developer-reference/docs/svn_REFERENCE.md" class="" title="svn_REFERENCE.md">svn_REFERENCE.md</a></li>' +
'<li><a href="/developer-reference/docs/vim_REFERENCE.md" class="" title="vim_REFERENCE.md">vim_REFERENCE.md</a></li>' +
// End the list
'</ul>';
		$("#devreference-main").append(psuedoIndex);

		// For dev purposes, output the current jQuery versioni
		console.log('jQuery ' + $.fn.jquery + ' loaded!');
	});

});
