Iuris::User.class_eval do
	has_many :meetings, class_name: "Iuris::Meetings::Meeting"
end