class CreatePostsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
    t.string :post_url
    t.string :by
    t.string :message
    t.datetime :created_at
  end
  end
end
