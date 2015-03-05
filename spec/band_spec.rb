require 'spec_helper'

describe Band do

  it { should have_many :concerts }

  it 'validates the presence of band name' do
    band = Band.new({:band_name => "Breaking Benjamin"})
    expect(band.band_name).to eq ("Breaking Benjamin")
  end

  it 'validates the length of band name' do
    band = Band.new({:band_name => "g".*(31)})
    expect(band.save).to eq (false)
  end
end
