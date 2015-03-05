class FixConcert < ActiveRecord::Migration
  def change
    remove_column :concerts, :band_id_id
    remove_column :concerts, :venue_id_id
  end
end
