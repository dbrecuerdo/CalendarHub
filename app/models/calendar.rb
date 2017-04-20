class Calendar < ApplicationRecord
    has_many :events, dependent: :destroy
    belongs_to :user
    validates :title, presence: true
    validates :user_id, presence: true
end
