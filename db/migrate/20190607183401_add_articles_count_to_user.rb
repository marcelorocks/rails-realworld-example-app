class AddArticlesCountToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :articles_count, :integer
    add_index :users, :articles_count
  end
end
