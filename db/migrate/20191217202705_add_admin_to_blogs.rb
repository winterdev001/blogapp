class AddAdminToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_reference :blogs, :admin, index: true
  end
end
