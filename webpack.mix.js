const mix = require('laravel-mix');


const glob = require("glob");

// set the public path
mix.setPublicPath('dist');

// JavaScript
mix.js('javascript/app.js', 'js')
.sourceMaps()
.autoload({ jquery: ['$', 'window.jQuery',"jQuery","window.$","jquery","window.jquery"] });

// SCSS
const scssFiles = glob.sync('scss/[^_]*.scss');
if (scssFiles.length) {
    for (let sass_file of scssFiles) {
        mix.sass(sass_file, 'css');
    }
 }

