class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :prompt
      t.string :answer

      t.timestamps
    end
  end
end
