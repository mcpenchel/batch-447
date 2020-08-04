class Artist
  # OLD WAY, we're not gonna use this anymore
  # def initialize(name, genre, instrument, gender, alive)

  attr_reader :name, :genre, :gender, :instrument
  attr_accessor :band, :id # which is attr_reader + attr_writer

  def initialize(attributes = {})
    @name  = attributes[:name]
    @genre = attributes[:genre]
    @instrument = attributes[:instrument]
    @gender = attributes[:gender]

    @alive  = attributes[:alive]
    @alive  = true if attributes[:alive].nil?

    @band = attributes[:band]
    @id = attributes[:id]
  end

  def alive?
    @alive
  end
end

# CRASH-TEST YOUR MODEL!

# ghrol = Artist.new(name: "Dave Ghrol", genre: "Rock", gender: "Male",
#                    instrument: "Drums, Vocals & Guitar",
#                    alive: false)

# ozzy = Artist.new(name: "Ozzy")

# puts ozzy.name

# puts ghrol.alive?
# puts ozzy.alive?
