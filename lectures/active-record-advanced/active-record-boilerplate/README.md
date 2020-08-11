## ActiveRecord Boilerplate

This is a starting point for the Activerecord Basics lecture using sqlite. During the lecture, you need to:

- Clone The project
- Run `bundle install`
- Explain `rake -T`
- Explain `config/database.yml`
- Run `rake db:create` / `rake db:drop`
- Create and run 2 migrations

## What we've learned so far about AR

- It helps us connect Ruby classes to Database tables
- It helps us to change the DB schema
    - We do that by creating migrations (set of instructions to change the DB)
    - And then running them (rake db:migrate)
- It gives us all the CRUD methods, so that we don't have to implement them

- To make a class work with AR, we need to inherit from ActiveRecord::Base

Talking about migrations, when we create a migration, we need to inherit from:
- ActiveRecord::Migration[5.1]

## AR Conventions

- Class name in SINGULAR, upperCamelCase
- Table name in PLURAL, snake_case

class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :gender
      t.integer :age

      t.timestamps # creates two columns, the created_at and the updated_at
    end
  end
end

class Pet < ActiveRecord::Base
end
