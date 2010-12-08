#dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
#require File.join(dir, 'httparty')
#require 'pp'
#config = YAML::load(File.read(File.join(ENV['HOME'], '.twitter')))

class Twitter
  include HTTParty
  base_uri 'twitter.com'

  def initialize(u, p)
    @auth = {:username => u, :password => p}
  end

  def post(text)
    options = { :query => {:status => text}, :basic_auth => @auth }
    self.class.post('/statuses/update.json', options)
  end
end

