class CreatePuns < ActiveRecord::Migration
  def change
    create_table :puns do |t|
      t.string :text

      t.timestamps null: false
    end
  end
end
