class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.textt :description
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :workout, null: false, foreign_key: true

      t.timestamps
    end
  end
end
