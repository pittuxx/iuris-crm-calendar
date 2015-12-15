Deface::Override.new(:virtual_path => 'layouts/iuris/_nav',
										:name => 'add_meetings_link_to_nav',
										:insert_after => "[data-iuris-hook='main-nav']",
										:partial => 'overrides/navbar_meetings_link',
										:namespaced => true,
										:original => 'cb1948d6f89dc8e5515b01b4d0583a746fc11b4c')