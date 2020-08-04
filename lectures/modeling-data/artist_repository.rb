require 'byebug'
require 'csv'
require_relative "artist"

class ArtistRepository
  def initialize(csv_file_path, band_repository)
    @csv_file_path = csv_file_path
    @artists = []
    @band_repository = band_repository
    load_csv

    if @artists.empty?
      @next_id = 1
    else
      @next_id = @artists.last.id + 1
    end
  end

  def all
    @artists
  end

  def add(artist)
    artist.id = @next_id
    @artists << artist
    # save_csv
    @next_id += 1
  end

  private
  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      # id,name,genre,gender,instrument,alive,band_id

      # TWO POSSIBLE VALUES FOR row[:alive]
      # => "true"
      # => "false"
      # if row[:alive] == "true"
      #   row[:alive] = true
      # else
      #   row[:alive] = false
      # end
      row[:alive]   = row[:alive] == "true"
      row[:id]      = row[:id].to_i
      row[:band_id] = row[:band_id].to_i

      row[:band] = @band_repository.find(row[:band_id])

      artist = Artist.new(row)

      @artists << artist
    end
  end
end

# CRASH-TEST YOUR REPO!
# Remember, this was made before we needed the band_repository

# repo = ArtistRepository.new('artists.csv')
# repo.all.each do |artist|
#   puts artist.id
#   puts artist.name
#   puts artist.genre
#   puts artist.gender
#   puts artist.instrument
#   puts artist.alive?
# end
