class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def Song.create
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
    self.all.find {|person| person.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end 
  end
  
  def self.alphabetical
    sorted_array = self.all.sort_by do |song|
      song.name[0]
    end
    sorted_array
  end
  
  def self.new_from_filename(mp3)
    artist_title = mp3.chomp(".mp3")
    artist_title_array = artist_title.split(" - ")
    new_song = Song.new
    new_song.artist_name = artist_title_array[0]
    new_song.name = artist_title_array[1]
    new_song
  end
  def self.create_from_filename(mp3)
    self.all << self.new_from_filename(mp3)
  end
  def self.destroy_all
    self.all.clear
    all
  end
end

Song.create_by_name("Pennyroyal Tea")
Song.create_by_name("Best Life")
Song.create_by_name("The Jitters")
Song.create_by_name("745 Sticky")
p Song.new_from_filename("Counting Crows - Recovering The Satellites.mp3")

p Song.alphabetical

