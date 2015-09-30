class @Products extends Socket
  handle: ->
    @socket.on 'products', (data) ->
      item = JSON.parse(data)
      console.log item
      event = item.event
      object = item.object
      switch event
        when 'create' then createEvent(object)
        when 'update' then updateEvent(object)
        when 'delete' then deleteEvent(object)

  createEvent = (object) =>
    string = "<tr class='#{object.id}'>
                  <td>#{object.name}</td>
                  <td>#{object.price}</td>
                  <td>#{object.fee}</td>
                  <td>#{object.quantity}</td>
                  <td></td>
                </tr>"
    console.log string
    $('.products').prepend(string)

  updateEvent = (object) ->
    string = "<td>#{object.name}</td>
                  <td>#{object.price}</td>
                  <td>#{object.fee}</td>
                  <td>#{object.quantity}</td>
                  <td></td>"
    $(".products .#{object.id}").html(string)

  deleteEvent = (object) ->
    console.log(object)
    $(".products .#{object.id}").remove()
