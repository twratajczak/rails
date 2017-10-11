class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_line_1
      t.date :dob
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
