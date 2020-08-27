den_of_foul_plants = Garden.create!(
  name: "Den of Foul Plants",
  banner_url: "https://steamuserimages-a.akamaihd.net/ugc/535135100393570816/F8448BB90A4C8E5FF4DD3BD56F1D90193C00694B/?imw=1024&imh=576&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=true"
)

garden_of_suffering = Garden.create!(
  name: "Garden of Suffering",
  banner_url: "https://www.wagmag.com/wp-content/uploads/2017/05/John_Everett_Millais_-_Ophelia_-_Google_Art_Project-690x469.jpg"
)

Plant.create!(
  name: "Murdersynthesis",
  image_url: "https://d3926qxcw0e1bh.cloudfront.net/post_photos/a3/5a/a35a8c73f4ffd7c3e82937dc4d9a220a.jpg.crop800x450.jpg",
  garden: den_of_foul_plants
)

Plant.create!(
  name: "Stalker of the Woods",
  image_url: "https://c.pxhere.com/photos/58/00/face_scary_horror_spooky_evil_creepy_expression_tree-1393484.jpg!d",
  garden: den_of_foul_plants
)
