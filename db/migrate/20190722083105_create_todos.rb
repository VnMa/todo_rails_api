class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :title, limit: 100
      t.string :content

      t.timestamps
    end
  end
end
