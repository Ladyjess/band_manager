class Venue < ActiveRecord::Base

  has_many :concerts
  has_many :bands, through: :concerts

  validates :venue_name, {:presence => true, :length => { :maximum => 30 }}

  before_save :upcase_venue_name



 private

   def upcase_venue_name
     self.venue_name=(venue_name.titleize)
   end
 end
