require 'csv'
require_relative 'band'

class BandRepository

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @bands = []
    load_csv

    if @bands.empty?
      @next_id = 1
    else
      @next_id = @bands.last.id + 1
    end
  end

  def find(band_id)
    @bands.find { |band| band.id == band_id }
  end

  def all
    @bands
  end

  private
  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      # id,name,genre,size
      row[:id] = row[:id].to_i
      row[:size] = row[:size].to_i

      band = Band.new(row)

      @bands << band
    end
  end
end

# CRASH-TEST YOUR REPO!

# repo = BandRepository.new('bands.csv')
# repo.all.each do |band|
#   puts band.id
#   puts band.name
#   puts band.genre
#   puts band.size
# end
