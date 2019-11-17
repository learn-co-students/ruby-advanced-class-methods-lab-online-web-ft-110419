class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create #class constructor
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(title) #class constructor
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title) #class constructor
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title) #class finder
    result = self.all.detect {|song| song.name == title}
    result
  end

  def self.find_or_create_by_name(title)
    #either return a matching song instance with that name or create a new song with the name and return the song instance
    result = self.find_by_name(title)
    if result
      result
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    sorted = self.all.sort_by {|song| song.name}
    sorted
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(filename)
    result = self.new_from_filename(filename)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end




















# class Song
#   attr_accessor :name, :artist_name
#   @@all = []
  
#   # def initialize
#   #   @@all << self   
#   # end 

#   def self.all
#     @@all
#   end
  
#   def self.create
#     song = self.new 
#     song 
#   end 
  
#   def self.new_by_name(name)
#     song = self.new 
#     song.name = name 
#     song 
#   end
  
#   def self.create_by_name(name)
#     song = self.new 
#     song.name = name 
#     @@all << song  
#     song 
#   end 
  
#   def self.find_by_name(name)
#     @@all.find{|x| x.name == name}
#     # song = self.new 
#     # song.name = name 
#   end 
  
#   def self.find_or_create_by_name(name)
#     self.find_by_name(name) || self.create_by_name(name)
#   end 
  
#   def self.alphabetical
#     # @@all.sort_by{|x| x.name}
#     self.all.sort_by{|s| s.name}
     
#   end
  
#   def self.new_from_filename(name)
#     song = self.new 
    
#     song.name = (name.split(" - ")[1].chomp(".mp3"))
#     song.artist_name = (name.split(" - ")[0])
#     song 
#   end 
  
#   def self.create_from_filename(name)
#     song = self.new
#     song.name = (name.split(" - ")[1].chomp(".mp3"))
#     song.artist_name = (name.split(" - ")[0])
#     @@all << song
#     song
#   end 
  
#   def self.destroy_all
#     @@all = []
#   end 

#   def save
#     self.class.all << self
#   end

# end

