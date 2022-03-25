class CreateWidgets < ActiveRecord::Migration[7.0]
  def change
    create_table :widgets do |t|
      t.string :name
      t.string :sizes
      t.string :colours
      t.string :flavours

      t.timestamps
    end
  end
end
