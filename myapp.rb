# myapp.rb
require 'sinatra'
require 'erb'
require 'github/markup'

Dir['./lib/*.rb'].each { |file| require file }

set :root, File.dirname(__FILE__)
set :views, Proc.new { File.join(root, "views") }

class MyApp < Sinatra::Base

  get '/' do
    Home.new.content
  end

  get '/post/:post' do
    Post.new("#{params[:post]}").content
  end

end

