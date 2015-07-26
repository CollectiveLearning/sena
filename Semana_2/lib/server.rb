require 'sinatra'
require 'active_support/all'

get '/empleado' do
  content_type :json
  users = [
      {id: 1, nombre: 'Ruben'},
      {id: 2, nombre: 'Alejandro'},
      {id: 3, nombre: 'Yonatan'}
  ]
  users.to_json
end

get '/nomina' do
  content_type :json
  nominas = [
      {id: 1, valor: 500000},
      {id: 2, valor: 200000},
      {id: 3, valor: 400000}
  ]
  nominas.to_json
end
