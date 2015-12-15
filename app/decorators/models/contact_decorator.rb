if Iuris::Core.avaiable?(:contacts)
	Iuris::Contacts::Contact.class_eval do
		has_many :meetings, class_name: "Iuris::Meetings::Meeting"
	end
end