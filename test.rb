require 'httparty'
require 'json'
require 'date'

# request = HTTParty.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=10629f6795fb4c9b8f408cf4e3f81374')
#
# news = JSON.parse(request.body)
#
# article = news['articles']
# p article.first['source']['name']

# article.each do |news|
# news['title']
# end
# d= DateTime.now
# p d.strftime("posted on %m/%d/%Y")
request = HTTParty.get('https://api.openweathermap.org/data/2.5/weather?zip=10001,us&appid=5dab0ed38cc904baea9f4d2f312e89fd')
req = request['main']
p req
# k = req['temp'].to_f
# fk= k - 273
# temp = fk.to_f * 1.8 + 32
# p temp.round
# App ID: my5D1Fx9e6yyLm2wSn5n
# App code: A0rHhW2FbeO78G-biuk8_Q
# App ID: ezpUiAO3HKm4FG31XSvJ
# App code: GSNkDMojKW1y-ruNn34F6w
