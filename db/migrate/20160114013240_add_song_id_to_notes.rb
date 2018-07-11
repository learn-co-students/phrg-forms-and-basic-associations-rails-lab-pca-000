# frozen_string_literal: true

class AddSongIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :song_id, :integer
  end
end
