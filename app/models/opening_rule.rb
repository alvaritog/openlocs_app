class OpeningRule < ApplicationRecord
  belongs_to :location
  
  enum weekday: Date::DAYNAMES

  validates_presence_of :weekday, :start_time, :end_time
  
end
