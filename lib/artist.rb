class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    na = all.detect {|artist| artist.name == name}
    return na if na != nil
    artist = self.new(name)
    artist.save
    artist
  end

  def print_songs
    puts songs.map  {|song| song.name}.join("\n")
  end
end
