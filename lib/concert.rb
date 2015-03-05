class Concert < ActiveRecord::Base
  belongs_to :band
  belongs_to :venue

#  validates :performance_date, :presence => true
end
