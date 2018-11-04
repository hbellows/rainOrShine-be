require 'rails_helper'

describe Forecast do
  it 'exists' do
    subject { Forcast.new('denver,co') }

    expect(subject).to be_a(Forecast)
  end
end