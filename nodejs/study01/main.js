'use restrict'

// var child = require('child_process');

var EventEmitter = require('events').EventEmitter;


function asyncFunc() {
  var ev = new EventEmitter;
  console.log('in asyncfunc');
  setTimeout(function() {
    ev.emit('done','foo','bar');
  }, 1000);
  return ev;
}


var async = asyncFunc();
async.on('done', function(arg1,arg2){
  console.log(arg1,arg2);
})

var spawnSync = require('child_process').spawnSync;

var ls;
var opts = {
  stdio: 'inherit'
};

ls = spawnSync('ls', [], opts);
ls = spawnSync('ls', [], opts);
ls = spawnSync('ls', [], opts);
