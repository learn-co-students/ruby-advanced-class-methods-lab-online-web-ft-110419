require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create 
    my_song = self.new
    @@all << my_song 
    my_song
  end
  
  def self.new_by_name(name)
    my_song = self.new
    my_song.name = name
    my_song
  end
  
  def self.create_by_name(name)
    my_song = self.new
    my_song.name = name  # save song with a name property
    @@all << my_song
    my_song
  end
  
  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ?  self.find_by_name(name) :  self.create_by_name(name)
  end 
  
  def self.new_from_filename(file)
    my_song = self.new
    my_song.artist_name = file.match(/\b^\w*\b/).to_s
    my_song.name = file.match(/(?![\b^\w*\b\n])\s[A-Z][a-z].*(?=[.])/).to_s.strip
    my_song
  end
  
  def self.create_from_filename(file)
    parsed_file = file.split(/[-.]/)
    my_song = self.new
    my_song.name = parsed_file[1].strip
    my_song.artist_name = parsed_file[0].strip
    @@all << my_song
    my_song
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.alphabetical
    @@all.sort {|a,b| a.name <=> b.name}
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
