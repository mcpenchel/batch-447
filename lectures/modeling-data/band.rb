# require_relative "artist"

class Band
  attr_reader :name, :genre, :size, :artists
  attr_accessor :id

  def initialize(attributes = {})
    @name = attributes[:name]
    @genre = attributes[:genre]
    @size = attributes[:size]
    @artists = attributes[:artists] || []
    @id = attributes[:id]
  end

  # Instance Method
  # Self is the object on which the method was called
  def play
    "We're rockiinnggg"
  end

  def hire(artist)
    @artists << artist
    artist.band = self
    # self in here is black sabbath in line 33, 34, 35, 36
    # self in line is pink floyd    in line 40
  end
end

# CRASH-TEST YOUR MODEL!

# black_sabbath = Band.new(name: "Black Sabbath", genre: "Rock", size: 4)

# ozzy = Artist.new(name: "Ozzy")
# tony = Artist.new(name: "Tony Iommi")
# butler = Artist.new(name: "Butler")
# renata = Artist.new(name: "Renata")

# black_sabbath.hire(ozzy)
# black_sabbath.hire(tony)
# black_sabbath.hire(butler)
# black_sabbath.hire(renata)

# pink_floyd = Band.new(name: "Pink Floyd")
# pink_floyd.hire(renata)

# black_sabbath.play

# black_sabbath.artists.each { |artist| puts artist.name }

# puts ozzy.band.name
