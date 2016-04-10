'use strict';
var webpack = require('webpack');
var path = require('path');
var autoprefixer = require('autoprefixer');
var lost = require('lost');

var $ = require('postcss-load-plugins')();

var buildEntries = function(hot) {
  var prefix = './app/';
  var entryFiles = ['./app/client.js'];
  var hotModuleUpdate = 'webpack-hot-middleware/client';
  var entries = {};
  entryFiles.map(function (entry) {
    var entryName = entry.slice(prefix.length).split('.js')[0];
    if(hot) {
      entries[entryName] = [entry, hotModuleUpdate];
    } else {
      entries[entryName] = entry;
    }
  });
  return entries;
};

var buildPlugins = function(hot, plugins, env) {
  if (hot) {
    return plugins.concat([
      new webpack.optimize.OccurenceOrderPlugin(),
      new webpack.HotModuleReplacementPlugin(),
      new webpack.NoErrorsPlugin()
    ]);
  } else if (env.production) {
    return plugins.concat([
      new webpack.optimize.UglifyJsPlugin({
  			compressor: {
  				warnings: false
  			}
  		}),
  		new webpack.optimize.DedupePlugin()
    ]);
  }
  return plugins;
};

var buildJsLoader = function (hot) {
  if (hot) {
    return { test: /\.jsx?$/, loader: 'babel', exclude: /node_modules/,
      query: {
        stage: 2,
        plugins: ['react-transform'],
        extra: {
          'react-transform': {
            transforms: [{
              transform: 'react-transform-hmr',
              imports: ['react'],
              locals: ['module']
            }]
          }
        }
      }
    };
  } else {
    return { test: /\.jsx?$/, loader: 'babel', exclude: /node_modules/ };
  }
}

module.exports = function makeConfig(hot, publicPath, apiPath) {

  var _env = process.env.NODE_ENV;
  var env = {
    production: _env === 'production',
    staging: _env === 'staging',
    test: _env === 'test',
    development: _env === 'development' || typeof _env === 'undefined'
  };

  var assetsPath = path.join(__dirname, 'public', 'assets');

  var jsFileName = env.development === true ? '[name].js' : '[name].[hash].js';

  return {
  		// The configuration for the client
  		name: 'client',
  		entry: buildEntries(hot),
  		output: {
  			path: assetsPath,
  			filename: jsFileName,
  			publicPath: publicPath
  		},
  		module: {
  			loaders: [
          buildJsLoader(hot),
          { test: /\.css$/, loader: 'style!css!postcss' },
          { test: /\.json/, loader: 'json-loader' },
          { test: /\.jpg$/,  loader: 'url?limit=10000&mimetype=image/jpeg' },
          { test: /\.png$/,  loader: 'url?limit=10000&mimetype=image/png' },
          { test: /\.woff$/, loader: 'url?limit=10000&mimetype=application/font-woff' },
          { test: /\.ttf$/,  loader: 'url?limit=10000&mimetype=application/octet-stream' },
          { test: /\.eot$/,  loader: 'file' },
          { test: /\.svg$/,  loader: 'url?limit=10000&mimetype=image/svg+xml' },
  			]
  		},
  		plugins: buildPlugins(hot, [
        function() {
          this.plugin('done', function(stats) {
            var fs = require('fs');
            var dir = path.join(__dirname, 'server', 'tmp');
            if (!fs.existsSync(dir)){
              fs.mkdirSync(dir);
            }
            fs.writeFileSync(path.join(__dirname, 'server', 'tmp', 'stats.generated.json'), JSON.stringify(stats.toJson()));
          });
        },
        new webpack.DefinePlugin({
          __API_PATH__: JSON.stringify(apiPath),
          __DEVTOOLS__: !!env.development
        })
      ], env),
      postcss: function(){
        return [
          lost,
          $.import({
              onImport: function (files) {
                  files.forEach(this.addDependency);
              }.bind(this)
          }),
          $.simpleVars,
          // $.mixins,
          $.nested,
          autoprefixer,
          // csswring
        ];
      }
  	};
};
