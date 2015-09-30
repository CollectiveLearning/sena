var io = require('socket.io')();
var redis = require('redis').createClient();

io.on('connection', function(socket){
  console.log('nueva conexión');
  redis.subscribe('ventas');
  redis.subscribe('compras');
  redis.subscribe('products');

  var callback = function(channel, data) {
        socket.emit(channel, data)
  };

  redis.on('message', callback);
  socket.on('disconnect', function(){
    console.log('Conexión eliminada');
    redis.removeListener('message', callback);
  });

});

console.log('Running....');
io.listen(4000);