var io = require('socket.io')();
var redis = require('redis').createClient();

io.on('connection', function(socket){
  console.log('nueva conexión');
  redis.subscribe('ventas');

  var callback = function(channel, data) {
        socket.emit('ventas', data)
  };

  redis.on('message', callback);
  socket.on('disconnect', function(){
    console.log('Conexión eliminada');
    redis.removeListener('message', callback);
  });

});

console.log('Running....');
io.listen(4000);