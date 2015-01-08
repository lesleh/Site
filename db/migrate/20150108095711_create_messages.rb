class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.string :ip
      t.text :body

      t.timestamps null: false
    end
  end
end