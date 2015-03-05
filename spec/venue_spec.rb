require 'spec_helper'

describe Venue do

  it { should have_many :concerts }

  it 'validates the presence of a venue name' do
    venue = Venue.new({:venue_name => "The O2"})
    expect(venue.venue_name).to eq ("The O2")
  end

  it 'validates the length of venue name' do
    venue = Venue.new({:venue_name => "g".*(31)})
    expect(venue.save).to eq (false)
  end

  it 'converts the names of a venue to capitalized' do
    venue = Venue.create({:venue_name => "zydeco ball"})
    expect(venue.venue_name). to eq ("Zydeco Ball")
  end
end
