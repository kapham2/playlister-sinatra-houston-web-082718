class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        self.name.gsub(/[',.";:!@#$%^&*()]/,'').split(" ").join("-").downcase
        # self.name.split(" ").join("-").downcase.gsub(/[',.";:!@#$%^&*()]/,'')
    end

    def self.find_by_slug(slug)
        Song.all.find do |song|
            song.slug == slug
        end
    end
    
  end