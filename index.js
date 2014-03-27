// dependencies
var JSFiddleApi = require ("jsfiddle-api")
  , config      = require ("./config")
  , fs          = require ("fs")
  ;

// get this fiddle
JSFiddleApi.getFiddle (process.argv[2] + "/" + (config.fiddleVersion || ""), function (err, fiddleObj) {

    // handle error
    if (err) { return console.log (err); }

    ++config.fiddleVersion;
    fs.writeFileSync ("./config.json", JSON.stringify (config, null, 4));

    fs.writeFileSync (process.argv[3] + "/index.html", JSON.stringify (config, null, 4));
    fs.writeFileSync (process.argv[3] + "/functions.js", JSON.stringify (config, null, 4));
    fs.writeFileSync (process.argv[3] + "/style.css", JSON.stringify (config, null, 4));
});
