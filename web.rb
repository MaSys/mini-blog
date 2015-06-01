# myapp.rb
require 'sinatra'
require 'erb'
require 'github/markup'

Dir['./lib/*.rb'].each { |file| require file }

class MyApp < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :public_folder, 'assets'
  set :static, true


  get '/' do
    Home.new.content
  end

  get '/posts/:post' do
    Posts.new("#{params[:post]}").content
  end

end

