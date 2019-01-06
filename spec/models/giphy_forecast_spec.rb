require 'rails_helper'

describe GiphyForecast do
  it 'can be created with attributes' do
    attributes = {
                  time: 1234, 
                  summary: 'Partly cloudy until afternoon.',
                  url: 'https://giphy.com/gifs/beach-clouds-aQ7kognlRPDzi'
                }

    forecast = GiphyForecast.new(attributes) 
    expect(forecast.forecast).to be_a(Hash)
    expect(forecast.forecast[:time]).to eq(1234)
    expect(forecast.forecast[:summary]).to eq('Partly cloudy until afternoon.')
    expect(forecast.forecast[:url]).to eq('https://giphy.com/gifs/beach-clouds-aQ7kognlRPDzi')    
  end
end