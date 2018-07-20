# frozen_string_literal: true

class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    if self.genre
      self.genre.name
    end
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_name
    if self.artist
      self.artist.name
    end
  end

  def note_contents=(note_content)
    note_content.each do |content|
      unless content.empty?
        note = Note.find_or_create_by(content: content)
        notes << note
      end
    end
  end

  def note_contents
    self.notes.map{ |note| note.content }
  end
end
