const mix = require("laravel-mix");
require("laravel-mix-polyfill");

require("dotenv").config({
    path: "../../.env",
});

// set up mix options
mix.options({
    processCssUrls: false,
});

// set the public path
mix.setPublicPath("dist");

// scss/css
mix.sass("scss/styles.scss", "css");

// js
mix.js("javascript/app.js", "js").polyfill({
    enabled: true,
    useBuiltIns: "usage",
    targets: false, // setting to false uses package.json's browserlist info
});

mix.sourceMaps(false);
