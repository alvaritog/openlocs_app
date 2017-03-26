class OpeningRule < ApplicationRecord
  belongs_to :location
  
  enum weekday: Date::DAYNAMES

  validates_presence_of :weekday, :start_time, :end_time
  
  scope :for_weekday, ->(weekday = nil) { weekday.nil? ? nil : where(:weekday => weekday) }

  scope :open_at, ->(datetime) {
    weekday = datetime.wday
    hours = datetime.hour
    minutes = datetime.minute
    time = DateTime.civil(2000, 01, 01, hours, minutes, 0)
    for_weekday(weekday).where("? BETWEEN start_time AND end_time", time.strftime("%H:%M:%S")) 
  }
  

end
