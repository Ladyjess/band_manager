class Band < ActiveRecord::Base

  scope :has_not_performed, -> do
   where({:performed => false})
  end

  has_many :concerts
  has_many :venues, through: :concerts

  validates :band_name, {:presence => true, :length => { :maximum => 30 }}

  #no callback in band name because bands can use all kinds of characters for
  #a name. I am not restricting their individuality and mode of expression.



end
