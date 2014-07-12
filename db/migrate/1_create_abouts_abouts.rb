class CreateAboutsAbouts < ActiveRecord::Migration

  def up
    create_table :refinery_abouts do |t|
      t.string :name
      t.integer :photo_id
      t.string :job_title
      t.text :description
      t.string :contact_email
      t.string :twitter_url
      t.string :facebook_url
      t.string :linkedin_url
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-abouts"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/abouts/abouts"})
    end

    drop_table :refinery_abouts

  end

end
