'use strict';
import React from 'react';
import ReactDOMServer from 'react-dom/server';

class Layout extends React.Component {
  render() {
    return (
      <html>
        <head>
          <meta charSet='utf-8' />
          <title>Exam Management System</title>
          <meta name='viewport' content='width=device-width' />
        </head>
        <body>
          <div id='app'></div>
          <script src={this.props.publicPath + this.props.assets.client}></script>
        </body>
      </html>
    );
  }
}

let layoutComponent = React.createFactory(Layout);

export default function(req, stats) {
  const assets = stats.assetsByChunkName;
  const publicPath = stats.publicPath;
  var html = ReactDOMServer.renderToStaticMarkup(layoutComponent({
    publicPath,
    assets
  }));

  return html;
}
