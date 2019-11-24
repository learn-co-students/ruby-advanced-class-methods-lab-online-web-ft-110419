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
    song = Song.new 
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new            #passingCuric
    song.name = name
    song 
  end
  
  def self.create_by_name(name)
    song = self.create            #passingCuric
    song.name = name 
    song 
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}    #passingRubyDoc
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)  #passingCoderW
  end
  
  def self.alphabetical
    self.all.sort_by{|n| n.name}     #passingRubGuidVid
  end
  
  def self.new_from_filename(file)
    rows = file.split(" - ")
      artist_name = rows[0]
      song_title = rows[1].sub(".mp3", "")  #passingDigiOcean
      song = self.new 
      song.name = song_title
      song.artist_name = artist_name
      song
 end
  
  def self.create_from_filename(file)
    rows = file.split(" - ")
      artist_name = rows[0]
      song_title = rows[1].sub(".mp3", "")  #passingDigiOcean
      song = self.create 
      song.name = song_title
      song.artist_name = artist_name
      song
  end
  
  def self.destroy_all
    @@all = []
  end
end
