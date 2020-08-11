class CreateInterns < ActiveRecord::Migration[5.1]
  def change
    create_table :interns do |t|
      t.string :first_name
      t.string :last_name
      t.references :doctor, foreign_key: true
      # IN SINGULAR
      # ALWAYS WITH FOREIGN_KEY: TRUE
      # the above line will create a doctor_id column

      t.timestamps
    end
  end
end
