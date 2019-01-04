require 'rails_helper'

describe GiphyForecast do
  it 'can be created with attributes' do
    attributes = {time: 1546585200, 
                  summary: "Partly cloudy until afternoon.",
                  url: "https://giphy.com/gifs/beach-clouds-aQ7kognlRPDzi"
                }

    forecast = GiphyForecast.new(attributes) 
    expect()    
  end
end