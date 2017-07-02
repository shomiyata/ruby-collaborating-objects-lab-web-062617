require 'pry'

class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    new_song = self.new(filename.chomp(".mp3").split(" - ")[1])
    artist = Artist.find_or_create_by_name(filename.chomp(".mp3").split(" - ")[0])
    artist.add_song(new_song)
    new_song
  end
end
