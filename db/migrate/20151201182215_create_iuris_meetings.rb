class CreateIurisMeetings < ActiveRecord::Migration
  def change
    create_table :iuris_meetings_meetings do |t|
      t.string :title
      t.string :body
      t.date :meeting_date
      t.time :starts
      t.time :ends
      t.references :user, index: true, foreign_key: true
      t.references :contact, index: true, foreign_key: true

      t.timestamps null: false
    end
    
    add_foreign_key :iuris_meetings_meetings, :iuris_users
    add_foreign_key :iuris_meetings_meetings, :iuris_contacts_contacts
  end
end
