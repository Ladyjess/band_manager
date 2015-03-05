class AddPerformanceDateToConcerts < ActiveRecord::Migration
  def change
    add_column :concerts, :performance_date, :datetime, index: true
  end
end
