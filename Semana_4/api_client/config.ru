require 'sinatra'
require 'json'
require 'byebug'
require 'httparty'
require 'active_support/all'

APP_PATH = File.dirname(__FILE__)
set :app_file, __FILE__

require_relative 'lib/controllers/application_controller'
require_relative 'lib/controllers/users_controller'
require_relative 'lib/controllers/posts_controller'
require_relative 'lib/models/wrapper/base'
require_relative 'lib/models/user'
require_relative 'lib/models/post'


map('/users') { run UsersController }
map('/posts') { run PostsController }