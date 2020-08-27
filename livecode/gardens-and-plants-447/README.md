# Parks and plants 🌴

A livecode done at Le Wagon Melbourne batch#447.

Let's code a Rails app with gardens and plants!

## Usage
Onboarding:
```bash
  cd ~/code/<your_github_nickname>
  git clone git@github.com:caioertai/parks-and-plants-447.git
  cd parks-and-plants-447
  bundle install
  yarn install
  rails db:create db:migrate db:seed
  # rake db:seed:replant # <---- you may want to do this if you want to reset the app DB to the initial seeds
```
Running the app:
```bash
  rails s # go to http://localhost:3000/gardens/
```

## Additional Livecode Info and Resources

### User Stories

```
- [x] As a user I can see plants of a garden
- [x] As a user I can add a plant in a garden
- [x] As a user I can delete a plant
```

<!-- /gardens/:garden_id/plants/new -->

### Front End Setup Guidelines

https://github.com/lewagon/rails-stylesheets/blob/master/README.md

### Seeds

```ruby
# db/seeds.rb
Garden.create!(
  name: "My Little Garden",
  banner_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/garden_1.jpg"
)

Garden.create!(
  name: "My Other Garden",
  banner_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/garden_2.jpg"
)
```

#### Card CSS
```css
.category-card {
  // [...]
  position: relative;
}

.card-remove-link {
  color: white;
  border-radius: 50%;
  border: 1px solid white;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 30px;
  width: 30px;
  position: absolute;
  right: 10px;
  top: 10px;
  opacity: 0.8;
  transform: rotate(45deg);
  font-weight: lighter;
  &:hover {
    color: white;
    text-decoration: none;
    opacity: 1;
  }
}
```

### Le Wagon UI Toolkit

https://uikit.lewagon.com/
