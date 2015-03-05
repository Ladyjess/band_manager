require 'spec_helper'

describe Concert do

  it { should belong_to :venue }

  it { should belong_to :band }

  it 'validates the presence of a performance date' do
    concert = Concert.new({:performance_date => "March 10, 2015 19:30:00"})
    expect(concert.performance_date).to eq ("March 10, 2015 19:30:00")
  end

end
