require 'rubygems'
require 'bundler'

Bundler.setup# :default, (ENV['RACK_ENV'] || 'development')

require 'sinatra'
require 'httparty'
require 'pry'

require './app'

run Sinatra::Application
