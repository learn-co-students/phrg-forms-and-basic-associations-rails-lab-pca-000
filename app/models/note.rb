# frozen_string_literal: true

class Note < ActiveRecord::Base
  belongs_to :song
end
