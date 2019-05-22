# frozen_string_literal: true

class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    genre&.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist&.name
  end

  def note_contents=(note_content)
    note_content.map do |content|
      if content.empty?
        note_contents
      else
        note = Note.find_or_create_by(content: content)
        notes << note
      end
    end
  end

  def note_contents
    notes.map(&:content)
  end
end
