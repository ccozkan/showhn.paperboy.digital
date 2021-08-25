class CreateAnnouncements < ActiveRecord::Migration[6.1]
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :body
      t.date :announced_at

      t.timestamps
    end
  end
end
