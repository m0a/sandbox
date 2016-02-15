"use strict";
var fs = require('fs');

function read(path){
  return function(callback) {
    fs.readFile(path,'utf8',callback);
  }
}

function* generator() {

    var path = 'a.txt';
    var b = yield read(path);
    b = b.replace('\n','');
    var c = yield read(b);
    c = c.replace('\n','');
    var result = yield read(c);

    console.log(result);
}
var g = generator();

function done(err,data) {
  var n = g.next(data);
  // console.log(n);
  if(n.done){
    return;
  }
  n.value(done);
}

g.next().value(done);

// g.next().value(function(err,data){
//   // console.log(err,data);
//   g.next(data).value(function(err,data){
//     //  console.log(err,data);
//     g.next(data).value(function(err,data){
//       g.next(data);
//     })
//   });
// });
