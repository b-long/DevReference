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
		var $mainDiv = $("#devreference-main"),
			currentYear = new Date().getFullYear(),
			linkToMyGithub = "http://github.com/b-long/",
			copywrightAndHeading = ''+
				'<h3>DevReference - Copywright '+
				'<a href="' + linkToMyGithub + '">b-long</a> ' + 
				currentYear + '</h3>';  // Copywright last updated 2013-08-27
		$mainDiv.append(copywrightAndHeading);

		var libraryContents = '' +
// TODO: Create this programmatically
// Start the list
'<ul id="files">' +
'<li><a href="/library/MyShellStuff.sh" class="" title="MyShellStuff.sh">MyShellStuff.sh</a></li>' +
'<li><a href="/library/emacs_REFERENCE.md" class="" title="emacs_REFERENCE.md">emacs_REFERENCE.md</a></li>' +
'<li><a href="/library/git_REFERENCE.md" class="" title="git_REFERENCE.md">git_REFERENCE.md</a></li>' +
'<li><a href="/library/oracle_REFERENCE.md" class="" title="oracle_REFERENCE.md">oracle_REFERENCE.md</a></li>' +
'<li><a href="/library/rpm_REFERENCE.md" class="" title="rpm_REFERENCE.md">rpm_REFERENCE.md</a></li>' +
'<li><a href="/library/rsync_REFERENCE.md" class="" title="rsync_REFERENCE.md">rsync_REFERENCE.md</a></li>' +
'<li><a href="/library/svn_REFERENCE.md" class="" title="svn_REFERENCE.md">svn_REFERENCE.md</a></li>' +
'<li><a href="/library/vim_REFERENCE.md" class="" title="vim_REFERENCE.md">vim_REFERENCE.md</a></li>' +
// End the list
'</ul>';
		$mainDiv.append(libraryContents);

		// For dev purposes, output the current jQuery versioni
		console.log('jQuery ' + $.fn.jquery + ' loaded!');
	});

});
