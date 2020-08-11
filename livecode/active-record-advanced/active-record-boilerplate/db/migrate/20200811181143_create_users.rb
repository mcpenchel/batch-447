class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :bank_account
      t.datetime :date_of_birth

      # TIMESTAMPS
      t.timestamps
    end
  end
end
