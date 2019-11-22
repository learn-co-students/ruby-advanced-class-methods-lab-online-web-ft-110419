class Song 
  attr_accessor :name, :artist_name 
  @@ll = []
  
  def self.all 
    @@all 
  end 
  
  def save 
    self.class.all << self 
  end 
  
  def self.create
    create << @@all 
  end 
  
