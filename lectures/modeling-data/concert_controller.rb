# Example of how a Concert Controller would work,
# if we needed to create a new concert.. And it has concert_hall_id and
#                                                   band_id

class ConcertController
  def create
    @view.list_bands_with_their_ids
    @view.list_concert_halls_with_their_ids

    band_id = @view.ask_user_for_band_id
    concert_hall_id = @view.ask_user_for_concert_hall_id
    concert_name = @view.ask_user_for_new_name

    band = @band_repository.find(band_id)
    concert_hall = @concert_hall_repository.find(concert_hall_id)

    concert = Concert.new(name: concert_name, band: band, concert_hall: concert_hall)

    @concert_repo.add(concert)
  end
end
