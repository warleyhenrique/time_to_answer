class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :description, null: false, unique: true

      t.timestamps
    end
    add_index :subjects, :description,                unique: true

  end
end
