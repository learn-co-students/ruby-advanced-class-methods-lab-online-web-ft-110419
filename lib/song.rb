class Song
  attr_accessor :name, :artist_name
  @@all = []
  def initialize 
    @name = name
    @@all << self 
  end 
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
   def self.create
     song = self.new 
     @@all << song.name
   end
   
   def self.find_by_name(name)
     self.all.find{|song| song.name == name}
   end
end
