require 'rubygems'

require 'sinatra'
require 'haml'

require 'rss'
require 'open-uri'

require 'newrelic_rpm'

get '/' do

  uri_blog = 'http://tknzk.hatenablog.jp/feed'
  uri_tech = 'http://tknzk.hateblo.jp/feed'

  feed_blog = RSS::Parser.parse(open(uri_blog))
  feed_tech = RSS::Parser.parse(open(uri_tech))

  libralies = [
    {:url => 'http://openpear.org/package/Services_Bitly', :title => 'Services_Bitly'},
    {:url => 'http://openpear.org/package/Services_GoogleChartApiQR', :title => 'Services_GoogleChartApiQR'},
    {:url => 'http://openpear.org/package/Services_Calil', :title => 'Services_Calil'},
    {:url => 'http://openpear.org/package/Services_Thanks', :title => 'Services_Thanks'},
  ]

  skills = [
    'Ruby',
    'PHP',
    'MySQL',
    'PostgreSQL',
    'DB2',
    'memcache',
    'Redis',
    'KyotoCabinet/KyotoTycoon',
    'MongoDB',
    'groonga',
    'nginx',
    'apache',
    'fluentd',
    'vim',
    'heroku',
    'AWS',
    'Parse',
    'hubot',
    'Docker',
    'Japanese',
  ]

  waf = [
    'sinatra',
    'Ruby on Rails',
    'symfony',
    'Laravel',
    'FuelPHP',
  ]

  @feed_blog = feed_blog
  @feed_tech = feed_tech
  @libralies = libralies
  @skills    = skills
  @waf       = waf

  set :haml, :format => :html5
  haml :index

end
