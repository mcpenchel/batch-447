my_garden = Garden.create!(
  name: "My Little Garden",
  banner_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/garden_1.jpg"
)

my_other_garden = Garden.create!(
  name: "My Other Garden",
  banner_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/garden_2.jpg"
)

Plant.create!(
  name: "Samambaia",
  image_url: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fae01.alicdn.com%2Fkf%2FHTB1TsNlPXXXXXcyXVXXq6xXFXXXx%2FSimula-o-persa-samambaia-samambaia-grama-planta-verde-artificial-deixa-flor-tape-aria-plantas-casa-loja.jpg&f=1&nofb=1",
  garden: my_garden
)

Plant.create!(
  name: "Monsterra",
  image_url: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimg.crocdn.co.uk%2Fimages%2Fproducts2%2Fpl%2F20%2F00%2F03%2F27%2Fpl2000032789.jpg%3Fwidth%3D940%26height%3D940&f=1&nofb=1",
  garden: my_garden
)
