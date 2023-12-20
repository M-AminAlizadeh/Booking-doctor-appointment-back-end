class AddImageUrlToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :image_url, :string, default: 'https://images.unsplash.com/photo-1484069560501-87d72b0c3669?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTM4fHx1c2VyfGVufDB8fDB8fHww'
  end
end
