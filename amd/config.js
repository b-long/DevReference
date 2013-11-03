// This file is responsible for the the requirejs:compile
// build output.  It is considered our "build profile" and
// is often referenced as build.js in RequireJS documentation.

require.config({
    baseUrl: '/DevReference/app',

    paths: {
        // the left side is the module ID,
        // the right side is the path to
        // the jQuery file, relative to baseUrl.
        // Also, the path should NOT include
        // the '.js' file extension. This example
        // is using jQuery 2.0.3 in a file named
        // jquery.js
        //
        // The mapping points to the file name relatively...
        // Is it relative to the HTML page or the config file?
        "jquery": "../bower_components/jquery/jquery"

                // ALTERNATVIE (via http://requirejs.org/docs/jquery.html#modulename )
                // The other (recommended) solution is to just name
                // the file 'jquery.js' and place it in the baseUrl
                // directory. Then the above paths entry is not needed.
                // You can avoid lots of configuration lines by
                // placing the files according to the default
                // ID-to-path convention of baseUrl + moduleID + '.js'.

                // TODO: What is this for?
                //"components": "../bower_components",

    }
});

//  TODO: What is this for?
if (!window.requireTestMode) {
    // This function is called when app/main.js is loaded.
    // If main.js calls define(), then this function is not
    // fired until main's dependencies have loaded.
    //
    // If appLoadedFunction were written like this:
    //
    // var appLoadedFunction = function(main){
    //      ... Some use of `main` ...
    // }
    //
    // the `main` argument would hold the module value
    // for "app/main".  However, we've currently configured
    // our build to throw a compiler error via the
    // .jshintrc file for unused variables


    var appLoadedFunction = function(){};
    require(['main'], appLoadedFunction);
}





