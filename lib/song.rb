class Song
  attr_accessor :artist_name
  attr_reader :name
  
  @@all = []
  
  def initialize(name)
    @name = name
  end
  
  def self.all
    return @@all
  end
  
  def save
    @@all << self
  end
  
  def self.create
    song = self.new("Powercore")
    song.artist_name = "Nekrogoblikon"
    song.save
    return song
  end
  
  def self.new_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    self.create_by_name(name)
  end
  
  def self.create_by_name(name)
    song = self.new(name)
    song.save
    return song
  end
  
  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    return nil
  end
  
  def self.find_or_create_by_name(name)
    return self.find_by_name(name) != nil ? self.find_by_name(name) : self.create_by_name(name)
  end
  
  def self.alphabetical
    return @@all.sort { |song1, song2| song1.name <=> song2.name }
  end
  
  def self.new_from_filename(filename)
    song = self.new(filename.split(/\s?-\s?/)[1].split(".mp3")[0])
    song.artist_name = filename.split(/[\s-]/)[0]
    return song
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
  
  def self.destroy_all
    @@all.clear
  end
end
