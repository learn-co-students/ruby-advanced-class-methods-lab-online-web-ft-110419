class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    s = self.new
    @@all << s
  return s
  end

def self.new_by_name(name)
  s = self.new
  s.name = name
  return s
end

def self.create_by_name(name)
  s = self.new
  s.name = name
  @@all << s
  return s
end

def self.find_by_name(name)
  @@all.find {|s| s.name == name}
end

def self.find_or_create_by_name(name)
  f = self.find_by_name(name)
  if f.nil?
  c = self.create_by_name(name)
   return c
 else
   return f
 end
end

def self.alphabetical
  @@all.sort_by {|s| s.name}
end

def self.new_from_filename(filename)
  s = self.new
  fileinfo = filename.split(" - ")
  artist = fileinfo[0]
  trackar = fileinfo[1].split('.')
  track = trackar[0]
  s.name = track
  s.artist_name = artist
  return s
end

def self.create_from_filename(filename)
  s = self.new
  fileinfo = filename.split(" - ")
  artist = fileinfo[0]
  trackar = fileinfo[1].split('.')
  track = trackar[0]
  s.name = track
  s.artist_name = artist
  @@all << s
end

def self.destroy_all
  @@all.clear
end

      def self.all
          @@all
      end
      def self.print_all
          @@all.each {|d| puts d.name}
      end
      def save
          @@all << self
      end
      def self.clear_all
          @@all.clear
      end
  def save
    self.class.all << self
  end
end
