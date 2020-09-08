class CreateUserBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_books do |t|
      t.integer :user_id
      t.integer :doctor_id
      t.datetime :booking_at

      t.timestamps
    end
  end
end
