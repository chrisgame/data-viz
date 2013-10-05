require 'bundler'
Bundler.require

class DataViz < Sinatra::Base

  get '/' do
    haml :f1_fastest_lap
  end

end
