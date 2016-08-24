axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
contentful   = require 'roots-contentful' 
require('dotenv').config()

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf']

  extensions: [
    js_pipeline(files: 'assets/js/*.js'),
    css_pipeline(files: 'assets/css/*.styl'),
    contentful
      preview: true
      access_token: process.env.CONTENTFUL_PREVIEW_KEY
      space_id: process.env.CONTENTFUL_SPACE_ID
      content_types:
        homePage: 
          id: "homePage",
          template: "views/index.jade"
        portfolioItem:
          id: "portfolioItem"
          
  ]

  stylus:
    use: [axis(), rupture(), autoprefixer()]
    sourcemap: true

  'coffee-script':
    sourcemap: true

  jade:
    pretty: true
