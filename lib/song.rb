class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    new_song = self.new
    self.all << new_song
    new_song
  end
  
  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end
  
  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    self.all << new_song
    new_song    
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song = self.create_by_name(name) if !song
    song
  end
  
  def self.alphabetical 
    sorted = self.all.sort_by{|song| song.name}
    sorted
  end
  
  def self.new_from_filename(name)
    artist, song = name.split("-")
    artist = artist.strip
    song = song.strip.split(".")[0]
    new_song = self.create_by_name(song)
    new_song.name = song 
    new_song.artist_name = artist
    new_song
  end
  
  def self.create_from_filename(name)
    new_song = self.new_from_filename(name)
    self.all << new_song
  end
  
  def self.destroy_all()
    self.all.clear
  end

end
