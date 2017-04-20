class Event < ApplicationRecord
    validates :title, presence: true
    validates :start, presence: true
    validates :end, presence: true
    validate :is_end_valid?
    belongs_to :calendar
    belongs_to :event_type

    def start_time
        self.start
    end

    def all_day_event?
      self.start == self.start.midnight && self.end == self.end.midnight ? true : false
    end

    private
      def is_end_valid?
        unless self[:start] <= self[:end]
          errors.add(:end, "cannot be before the start")
        end
      end
end
