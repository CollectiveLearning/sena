class @Dashboard extends Socket
  handle: ->
    @ventasChannel()
    @comprasChannel()

  ventasChannel: ->
    @socket.on 'ventas', (data) ->
      item = JSON.parse(data)
      string = "<tr>
                  <td>#{item.product_id}</td>
                  <td>#{item.quantity}</td>
                  <td>#{item.created_at}</td>
                  </tr>"
      $('.latest-sells').prepend(string)

  comprasChannel: ->
    @socket.on 'compras', (data) ->
      item = JSON.parse(data)

      string = "<tr>
                  <td>#{item.name}</td>
                  <td>#{item.quantity}</td>
                  </tr>"
      $('.to-buy').prepend(string)
