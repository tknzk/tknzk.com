# frozen_string_literal: true

require 'rubygems'
require 'sinatra'
require 'haml'

get '/' do
  libralies = [
    { url: 'https://github.com/tknzk/ehproxy', title: 'ehproxy' },
    { url: 'https://github.com/tknzk/gcf_chatwork', title: 'GCF ChatWork' },
    { url: 'https://github.com/tknzk/gcf_line_notify', title: 'GCF LINE Notify' },
    { url: 'https://github.com/tknzk/Services_Bitly', title: 'Services_Bitly' },
    { url: 'https://github.com/tknzk/Services_GoogleChartApiQR', title: 'Services_GoogleChartApiQR' }
  ]

  @libralies = libralies

  haml :index, format: :html5
end
