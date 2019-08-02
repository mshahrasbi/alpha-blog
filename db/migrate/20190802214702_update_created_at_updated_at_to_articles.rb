class UpdateCreatedAtUpdatedAtToArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :create_at
    remove_column :articles, :update_at
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
