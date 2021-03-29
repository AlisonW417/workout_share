class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.string :name
      t.date :date_completed
      t.integer :duration
      t.boolean :cardio
      t.boolean :strength
      t.integer :average_heart_rate
      t.integer :total_calories
      t.text :description

      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
