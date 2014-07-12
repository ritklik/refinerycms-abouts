module Refinery
  module Abouts
    class About < Refinery::Core::BaseModel
      self.table_name = 'refinery_abouts'

      attr_accessible :name, :photo_id, :job_title, :description, :contact_email, :twitter_url, :facebook_url, :linkedin_url, :position

      validates :name, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
