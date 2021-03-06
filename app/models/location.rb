class Location < ApplicationRecord

  has_many :opening_rules, :dependent => :destroy
  accepts_nested_attributes_for :opening_rules, :allow_destroy => true, reject_if: :all_blank

  validates_presence_of :address

  def open?
    opening_rules.open_at(DateTime.current).any?
  end
  
  def h_opening_rules
    opening_rules.weekdays.collect do |weekday_name,weekday_val| 
      rr = opening_rules.for_weekday(weekday_name)
      times = rr.collect{|r| r.start_time.strftime("%H:%M") + '-' + r.end_time.strftime("%H:%M")}
      times_str = times.empty? ? 'closed' : times.join(', ')
      "#{weekday_name} : #{times_str}"
    end    
  end
  

end
