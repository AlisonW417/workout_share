class AddCategoryIdToWorkouts < ActiveRecord::Migration[6.1]
  def change
    add_column :workouts, :category_id, :integer
  end
end
