require_relative 'concerns/slugifiable'

class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    Slugifiable.slug(self.name)
  end

  def self.find_by_slug(slug)
    Slugifiable.find_by_slug(slug, self)
  end

end
