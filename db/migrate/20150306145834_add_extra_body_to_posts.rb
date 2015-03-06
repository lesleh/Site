class AddExtraBodyToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :extra_body, :text, after: :body
  end
end
