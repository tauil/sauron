require 'sinatra'
require 'twitter'
require 'pry-byebug'
require "sinatra/cors"

client = Twitter::REST::Client.new do |config|
  config.consumer_key    = "NgdjYxsXaG4e00FtnTD3FWZgm"
  config.consumer_secret = "nUZJVdjFmlf49H7ME68FBoCl9zGYyBciO6dul34kNQ5kOZfzKx"
end

set :bind, '0.0.0.0'

set :allow_origin, "http://localhost:4200"
set :allow_methods, "GET"
set :allow_headers, "content-type,if-modified-since"
set :expose_headers, "location,link"

get '/' do
  erb :index
end

get '/search' do
  search_term = params[:search_term]
  tweets = client.search(search_term, result_type: "recent").take(50)
  result = []

  tweets.each do |tweet|
    result.push({ user: { name: tweet.user.name, link: tweet.user.url, photo: tweet.user.profile_image_url },
                  text: { body: tweet.text, full_body: tweet.full_text, link: tweet.url } })
  end

  result.to_json
end
