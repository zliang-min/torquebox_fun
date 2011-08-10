# encoding: utf-8

require 'bundler/setup'
require 'sinatra/base'
require 'slim'

class Gimi < Sinatra::Base
  set :root, File.expand_path('..', __FILE__)

  get '/' do
    slim :index, :layout => false
  end

  get '/slides' do
    slim :slides, :layout => false
  end
end
