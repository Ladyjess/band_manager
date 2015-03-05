class AddForeignKey < ActiveRecord::Migration
  def change
    add_column :concerts, :band_id, :integer, index:true
    add_column :concerts, :venue_id, :integer, index:true
  end
end
