require 'rails_helper'

describe Forecast do
  user_location = 'denver,co'
  subject { Forecast.new(user_location) }
  
  it 'exists' do

    expect(subject).to be_a(Forecast)
  end
end
