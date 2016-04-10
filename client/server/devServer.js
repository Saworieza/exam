'use strict';
require('babel/register');

var webpack = require('webpack');
var webpackConfig = require('../webpack.dev.config');

//Server
var express = require('express');
var path = require('path');
var page = require('./page');

var app = express();
var compiler = webpack(webpackConfig);
app.use(require('webpack-dev-middleware')(compiler, {
  noInfo: true,
  publicPath: webpackConfig.output.publicPath
}));
app.use(express.static(path.join(__dirname, '..', 'public')));
app.use(require('webpack-hot-middleware')(compiler));

var stats = require('./tmp/stats.generated.json');

app.get('*', function (req, res) {
  res.type('html');
  res.write('<!DOCTYPE html>' + page(req, stats));
  res.end();
});

var port = Number(process.env.PORT || 3000);
app.listen(port, function () {
  console.log('Listening on port %d', port);
});
