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

#https://dev.twitter.com
get '/tweets' do
    require 'twitter'
    OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
    client = Twitter::REST::Client.new do |config|
        config.consumer_key = "h7tlbn9qdyA15VcRQjU5vG1yW"
        config.consumer_secret = "fMl6MwHjVWQ6hO8mkvVjfbzMn6jZI4qcqsjUslOsIIcbQCYw7P"
        config.access_token = "567667222-H7bZoZ05SvV3q0NKYYM6f34EDg4V4warm5OH7iak"
        config.access_token_secret = "bDMsZqnmX6XTZYHIujTvOsajxRUfSwZCnXJzCqnXsbo3q"
    end
    
         @search_results = client.search("@mercerfootball", result_type: "recent").take(30).collect do |tweet|
      #"#{tweet.user.screen_name}: #{tweet.text}"
        tweet
    end
    
    @title = "My ____ Tweets"
    @description = "This page contains my tweets that _____"
    @tweets = "active"
    erb :tweets
end

get '/news' do
    require 'google-search'
    query = "Mercer football"
    #@results = "test"
    @results = Array.new
    Google::Search::News.new do |search|
        search.query = query
        search.size = :large
    end.each { |item| @results.push item }
    
    @title = "New Stories"
    @description = "News Stories About Mercer Football."
    @news = "active"
    erb :news
end