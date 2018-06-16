# frozen_string_literal: true

require "rubygems"

require "sinatra"
require "haml"

require "rss"
require "open-uri"

require "newrelic_rpm"

get "/" do
  uri_blog = "http://tknzk.hatenablog.jp/feed"
  uri_tech = "http://tknzk.hateblo.jp/feed"

  feed_blog = RSS::Parser.parse(open(uri_blog))
  feed_tech = RSS::Parser.parse(open(uri_tech))

  libralies = [
    {url: "https://github.com/tknzk/ehproxy", title: "ehproxy"},
    {url: "https://github.com/tknzk/gcf_chatwork", title: "GCF ChatWork"},
    {url: "https://github.com/tknzk/gcf_line_notify", title: "GCF LINE Notify"},
    {url: "https://github.com/tknzk/Services_Bitly", title: "Services_Bitly"},
    {url: "https://github.com/tknzk/Services_GoogleChartApiQR", title: "Services_GoogleChartApiQR"},
  ]

  skills = %w[
    Ruby
    PHP
    Go
    MySQL
    PostgreSQL
    memcache
    Redis
    MongoDB
    groonga
    nginx
    fluentd
    vim
    heroku
    AWS
    GCP
    hubot
    Docker
    Japanese
  ]

  waf = [
    "sinatra",
    "Ruby on Rails",
    "symfony",
    "Laravel",
    "FuelPHP",
  ]

  @feed_blog_items = feed_blog.items.slice(0..4)
  @feed_tech_items = feed_tech.items.slice(0..4)
  @libralies = libralies
  @skills = skills
  @waf = waf

  haml :index, format: :html5
end
