class ArtworkShare < ApplicationRecord
    validates :viewer_id, presence: true
    validates :artwork_id, presence: true, uniqueness: {scope: :viewer_id}
end