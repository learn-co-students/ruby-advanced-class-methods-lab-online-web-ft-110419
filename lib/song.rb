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
    song = self.new 
    song.save
    song
  end
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  def self.find_by_name(name)
    song = self.all.find {|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    name
    if !find_by_name(name)
      create_by_name(name)
    else 
      find_by_name(name)
    end
  end
  def self.alphabetical
    self.all.sort_by {|element| element.name}
  end
  def self.new_from_filename(string)
   array = string.sub!(/.mp3/,'').split(' - ')
    song = self.create
    song.name = array[1]
    song.artist_name = array[0]
    
    song
  end
  def self.create_from_filename(string)
    result = string.sub!(/.mp3/,'').split(' - ')
      
      song = self.create
      song.artist_name = result[0]
      song.name = result[1]
    
      song
  end
  def self.destroy_all
    self.all.clear
  end
end
    
  
