class AddNationalityToPatients < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :nationality, :string
  end
end
