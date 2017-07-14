class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :author
      t.text :content
      t.string :date
      t.string :time
      t.string :category

      t.timestamps
      
    end
  end
end
