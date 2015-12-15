Deface::Override.new(:virtual_path => "iuris/admin/admin/index",
										:name => "add_meetings_prev_to_admin",
										:insert_after => "[data-iuris-hook='admin-prevs']",
										:partial => "overrides/admin_meetings_prev",
										:namespaced => true,
										:original => 'c169ce33fa8328bb8b1b0ed9be552b9d8627f00a')