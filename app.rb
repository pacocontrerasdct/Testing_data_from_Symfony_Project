require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'
require 'httparty'

get '/' do
  @gitHub_hash = HTTParty.get "https://api.github.com/repos/symfony/symfony/pulls"
  erb :home
end

get '/issues' do
  @gitHub_issues = HTTParty.get "https://api.github.com/repos/symfony/symfony/issues"
  erb :home
end

get '/next_pulls/:value' do |n|
  @gitHub_hash = HTTParty.get "https://api.github.com/repos/symfony/symfony/pulls?page=#{n}&q=is%3Apr+is%3Aopen"
  erb :home  
end

get '/next_issues/:value' do |n|
  @gitHub_issues = HTTParty.get "https://api.github.com/repos/symfony/symfony/issues?page=#{n}&q=is%3Apr+is%3Aopen"
  erb :home  
end





