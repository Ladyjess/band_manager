require 'spec_helper'

describe Concert do

  it { should belong_to :venue }

  it { should belong_to :band }

end
