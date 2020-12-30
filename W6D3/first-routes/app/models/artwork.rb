# == Schema Information
#
# Table name: artworks
#
#  id        :bigint           not null, primary key
#  title     :string           not null
#  image_url :string           not null
#  artist_id :integer          not null
#
class Artwork < ApplicationRecord
    validates :image_url, uniqueness: true
    validates :title, uniqueness: { scope: :artist_id }

    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User
end

