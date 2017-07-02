require 'pry'

class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_or_create_by_name(name)
    result = self.all.find {|artist| artist.name == name}
      if result == nil
        Artist.new(name)
      else
        self.all.find {|artist| artist.name == name}
      end
  end

  def add_song(song)
    self.songs << song
    song.artist = self
  end

  def print_songs
    self.songs.each { |song| puts song.name }
  end
#binding.pry
end
