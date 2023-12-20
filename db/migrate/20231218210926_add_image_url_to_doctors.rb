class AddImageUrlToDoctors < ActiveRecord::Migration[7.1]
  def change
    add_column :doctors, :image_url, :string, default: 'https://images.unsplash.com/photo-1579684453377-48ec05c6b30a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzA2fHxkb2N0b3J8ZW58MHx8MHx8fDA%3D'
  end
end
