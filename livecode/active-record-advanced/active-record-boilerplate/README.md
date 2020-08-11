## HOW TO CREATE THE MODEL LAYER

1. Draw the DB schema somewhere, so you can identify all the tables and all the relations between them
2. Create the models (for each model)
  * Create the class that inherits from ActiveRecord::Base in app/models/
  * Create the migration class that inherits from ActiveRecord::Migration in db/migrate/
3. How to define the order on which you'll be creatings every model+migration? Look for independent tables. Example:
  * User (doesn't need anything)
  * Aparment (needs the User)
  * Rental (needs the User and the Apartment)

### WHEN CREATING A MIGRATION, ALWAYS (until we get to Rails):

```
TIMESTAMP=`rake db:timestamp`
touch db/migrate/${TIMESTAMP}_create_users.rb
```

Inside the migration, it's always:

```ruby
class NameOfTheFile < ActiveRecord::Migration[5.2]
  def change
    create_table :name_of_the_table_remember_its_on_plural do |t|
      t.type_of_the_column :name_of_the_column

      # EXCEPTIONS
      # Associations
      t.references :name_of_the_model_in_singular, foreign_key: true

      # TIMESTAMPS
      t.timestamps
    end
  end
end
```
