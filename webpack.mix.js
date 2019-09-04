const mix = require('laravel-mix');
require('laravel-mix-eslint');
require('laravel-mix-stylelint');
const path = require('path')


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

// Linting
if (process.env.MIX_LINTING) {
    // stylelint
    if (scssFiles.length) {
        mix.stylelint({
            configFile: './.stylelintrc',
            files: ['scss/**/*.scss'],
            context: '.'
        });
    }

    // eslint
    mix.eslint();
}

// source maps
if (!mix.inProduction()) {
    mix.sourceMaps(true, 'source-map');
}


// browser sync
if (process.env.MIX_HOST_DOMAIN && process.env.MIX_PROXY_URL) {
    mix.browserSync({
        host: process.env.MIX_HOST_DOMAIN,
        proxy: process.env.MIX_PROXY_URL,
        https: true,
        open: 'external',
        files: [
            'dist/css/**/*.css',
            'dist/js/**/*.js',
            'dist/js/**/*.jsx',
            'templates/'
        ]
    });
}
