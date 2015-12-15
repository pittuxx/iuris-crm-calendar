if Iuris::Core.avaiable?(:contacts)

	Deface::Override.new(:virtual_path => "iuris/contacts/contacts/show",
											:name => "add_meetings_to_contact",
											:insert_after => "[data-iuris-hook='contacts_show']",
											:partial => "overrides/contact_meetings_list",
											:namespaced => true,
											:original => 'bfcca4c1d323c098f7f62c8fc434a8d5f6ee1a92')

end