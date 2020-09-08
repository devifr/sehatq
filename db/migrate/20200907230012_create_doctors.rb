class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialist
      t.string :phone
      t.string :start_at
      t.string :finish_at

      t.timestamps
    end
  end
end
