require 'sinatra'
require 'sinatra/reloader' if development?

get "/" do
    @title = "Tricia Surber's Portfolio"
    @description = "This site showcases all of the awesome things that Tricia Surber has done."
    @home = "active"
    erb :home
end

get '/about' do
    @title = "About Me"
    @description = "This page provides a short bio for Tricia Surber."
    @about = "active"
    erb :about
end

get '/works' do
    @title = "My Clips"
    @description = "This page provides links to Tricia Surber's published clips."
    @works = "active"
    erb :works
end

