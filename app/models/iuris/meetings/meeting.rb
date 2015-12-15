module Iuris::Meetings
  class Meeting < ActiveRecord::Base
    belongs_to :user
    
    if Iuris::Core.avaiable?(:contacts)
    	belongs_to :contact, class_name: 'Iuris::Contacts::Contact'
    end
		
		scope :created, -> {order('created_at desc')}

    scope :ordered, -> {order('meeting_date desc')}

  end
end
