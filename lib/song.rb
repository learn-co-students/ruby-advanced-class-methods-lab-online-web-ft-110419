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
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end


  def self.new_from_filename(filename)
    filename_split = filename.split(" - ")
    filename_split[1] = filename_split[1].chomp(".mp3")
    song = self.new
    song.name = filename_split[1]
    song.artist_name = filename_split[0]
    song
  end

  def self.create_from_filename(filename)
    filename_split = filename.split(" - ")
    filename_split[1] = filename_split[1].chomp(".mp3")
    song = self.new
    song.name = filename_split[1]
    song.artist_name = filename_split[0]
    @@all << song
    song
  end
  
end
