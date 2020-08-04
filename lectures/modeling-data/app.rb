require_relative 'band_repository'
require_relative 'artist_repository'

band_repository = BandRepository.new('bands.csv')
artist_repository = ArtistRepository.new('artists.csv', band_repository)

artist_repository.all.each do |artist|
  puts "#{artist.name} plays #{artist.instrument} for #{artist.band.name}"
end
