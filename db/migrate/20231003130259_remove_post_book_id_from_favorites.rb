class RemovePostBookIdFromFavorites < ActiveRecord::Migration[6.1]
  def change
    remove_column :favorites, :post_book_id, :integer
  end
end
