module Refinery
  module Abouts
    module Admin
      class AboutsController < ::Refinery::AdminController

        crudify :'refinery/abouts/about',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
