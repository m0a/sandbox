"use strict";
/// <reference path="./typings/node/node.d.ts"/>
import fs = require('fs');


function generator(){
  var path = 'a.txt';


  fs.readFile(path,'utf-8',function(err,data){
    path = data.replace('\n','');
  })

  fs.readFile(path,'utf-8',function(err,data){
    path = data.replace('\n','');
  })

  fs.readFile(path,'utf-8', function(err,data){
    console.log(data);
  });

}


var g = generator();
g.next();
