require 'sinatra'
require 'json'
require 'byebug'
require 'httparty'

APP_PATH = File.dirname(__FILE__)

require_relative 'lib/controllers/application_controller'
require_relative 'lib/controllers/users_controller'
require_relative 'lib/models/wrapper/base'
require_relative 'lib/models/user'


map('/users') { run UsersController }