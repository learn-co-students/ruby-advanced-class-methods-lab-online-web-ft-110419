class Song

  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    @@all << song
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    return song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find = self.find_by_name(name)
    if find.nil?
      create = self.create_by_name(name)
      return create
    else
      return find
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_info)
    song = self.new
    file_name = file_info.split(" - ")
    artist = file_name[0]
    track = file_name[1].split('.')
    track_name = track[0]
    song.artist_name = artist
    song.name = track_name
    return song
  end

  def self.create_from_filename(file_info)
    song = self.new
    file_name = file_info.split(" - ")
    artist = file_name[0]
    track = file_name[1].split('.')
    track_name = track[0]
    song.artist_name = artist
    song.name = track_name
    @@all << song

  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
