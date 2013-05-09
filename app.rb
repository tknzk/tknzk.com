require 'rubygems'
require 'feed-normalizer'

require 'sinatra'
require 'open-uri'

configure :production do
    require 'newrelic_rpm'
end

get '/' do

    uri_blog = 'http://tknzk.hatenablog.jp/feed'
    uri_tech = 'http://tknzk.hateblo.jp/feed'

    feed_blog = FeedNormalizer::FeedNormalizer.parse open(uri_blog)
    feed_tech = FeedNormalizer::FeedNormalizer.parse open(uri_tech)

    #feed.entries.each{ |e|
    #    puts e.url
    #    puts e.title
    #    puts e.last_updated
    #    puts ''
    #}

    erb :index,
        :locals => {
            :feed_blog => feed_blog,
            :feed_tech => feed_tech
            }

end

get '/qr_code' do
    erb :qr_code, layout: false
end
