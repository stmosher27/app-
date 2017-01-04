var path = require("path");

module.exports = {
  context: __dirname,
  entry: "./app/frontend/todo_redux.jsx",
  output: {
    path: './app/assets/javascripts',
    filename: "bundle.js",
    devtoolModuleFilenameTemplate: '[resourcePath]',
    devtoolFallbackModuleFilenameTemplate: '[resourcePath]?[hash]'
  },
  module: {
    loaders: [
      {
        test: [/\.jsx?$/],
        exclude: /node_modules/,
        loader: 'babel',
        query: {
          presets: ["es2015","react"]
        }
      }
    ]
  },
  devtool: 'source-maps',
  resolve: {
    extensions: ["", ".js", ".jsx" ]
  }
}
