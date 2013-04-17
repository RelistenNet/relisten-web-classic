require('coffee-script');
var cluster = require('cluster');

var numCPUs = require('os').cpus().length;

if (cluster.isMaster) {
  console.log('Clustering with', numCPUs, 'CPUs');
  for (var i = 0; i < numCPUs; i++)
    cluster.fork()
}
else
  require('./server/index');

// don't crash for now
process.on('uncaughtException', function (err) {
   console.log(err.stack);
});
