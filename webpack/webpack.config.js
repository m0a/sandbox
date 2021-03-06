/* global module, __dirname */

 module.exports = {
    entry: "./entry.js",
    output: {
      path: __dirname,
      filename: "bundle.js"
    },
    module: {
      loaders: [
        { test: /\.css$/,loader:"style!css" }
      ]
    }
};

// module.exports = {
//     entry: "./entry.js",
//     output: {
//         path: __dirname,
//         filename: "bundle.js"
//     },
//     module: {
//         loaders: [
//             { test: /\.css$/, loader: "style!css" }
//         ]
//     }
// };
