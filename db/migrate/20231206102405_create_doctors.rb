class CreateDoctors < ActiveRecord::Migration[7.1]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :hospital
      t.string :specialization
      t.integer :cost_per_consult
      t.text :description

      t.timestamps
    end
  end
end
