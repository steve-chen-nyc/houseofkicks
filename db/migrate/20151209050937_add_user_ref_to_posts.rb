class AddUserRefToPosts < ActiveRecord::Migration
  def change
    add_reference :post, :user, index: true, foreign_key: true
  end
end
