class Event < ApplicationRecord
    validates :title, presence: true
    validates :start, presence: true
    validates :end, presence: true

    belongs_to :calendar
    belongs_to :event_type

    def start_time
        self.start
    end
end
