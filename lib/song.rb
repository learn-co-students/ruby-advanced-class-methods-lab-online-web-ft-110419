require "pry"
class Song
  attr_accessor :name, :artist_name

  @@all = []
def initialize
  @@all.push(self)
end
  def self.create
      self.new
  end
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  def self.create_by_name(name)
      song = self.new
      song.name = name
      song
  end
  def self.find_by_name(name)
    @@all.find{|song|song.name == name}
  end

  def self.find_or_create_by_name(name)

    if self.find_by_name(name)
       instance = self.find_by_name(name)
     return instance
    else
   song = self.create_by_name(name)
   song
    end
  end
  def self.new_from_filename(name)
    song = self.new
    song_array = name.split(" - ")
    song_and_format = song_array[1].split(".")
    song.artist_name = song_array[0]
    song.name = song_and_format[0]
    song

  end
  def self.create_from_filename(name)
      song = self.new
    @@all.push(song)
    song_array = name.split(" - ")
    song_and_format = song_array[1].split(".")
    song.artist_name = song_array[0]
    song.name = song_and_format[0]
    song

  end
  def self.destroy_all
    @@all.clear
end
  def self.alphabetical
    @@all.sort{|a,b| a.name <=> b.name}
  end
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
