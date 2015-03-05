class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.belongs_to :band_id, index: true
      t.belongs_to :venue_id, index: true
    end
  end
end
