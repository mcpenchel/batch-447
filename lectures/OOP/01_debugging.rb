# frozen_string_literal: true

require 'pry-byebug'

best_bands = ['Mastodon', 'Arcadea', 'Jethro Tull', 'Jefferson Airplaine']

best_bands.each do |band|
  binding.pry
  puts "#{band} is awesome!"
end
