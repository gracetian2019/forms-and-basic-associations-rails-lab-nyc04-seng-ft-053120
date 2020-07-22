class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name:name)
  end
  def artist_name
    self.artist ? self.artist.name : nil
  end
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name:name)
  end
  def genre_name
    self.genre ? self.genre.name : nil
  end
  def note_contents=(cs)
    cs.each do |c|
      if c.length>0
      note = Note.find_or_create_by(content:c)
      self.notes << note
      end
    end
  end
  def note_contents
    #array.map(&:method)=>:method_name.to_proc
    self.notes.map{|note|note.content}  #(&:content)
  end
end
