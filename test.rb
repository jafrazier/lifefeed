require 'httparty'
require 'json'

request = HTTParty.get('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=10629f6795fb4c9b8f408cf4e3f81374')

news = JSON.parse(request.body)

article = news['articles']
article.each do |news|
puts news['title']
end
