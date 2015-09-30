$(document).on 'page:change', ->
  new SocketDispatcher()

class SocketDispatcher
  constructor: ->
    @handler()

  handler: ->
    controller = $('body').data('controller')
    handlerClass = switch controller
      when 'admin' then new Dashboard()
      when 'products' then new Products()
      else null

    if handlerClass != null
      handlerClass.handle()