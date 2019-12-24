class AddCategoryToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :category, :string
  end
end
