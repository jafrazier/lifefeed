require 'httparty'
require 'json'
require 'date'

request = HTTParty.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=10629f6795fb4c9b8f408cf4e3f81374')

news = JSON.parse(request.body)

article = news['articles']
p article.first['source']['name']

# article.each do |news|
# news['title']
# end
