# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Abouts" do
    describe "Admin" do
      describe "abouts" do
        refinery_login_with :refinery_user

        describe "abouts list" do
          before do
            FactoryGirl.create(:about, :name => "UniqueTitleOne")
            FactoryGirl.create(:about, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.abouts_admin_abouts_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.abouts_admin_abouts_path

            click_link "Add New About"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Abouts::About.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Abouts::About.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:about, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.abouts_admin_abouts_path

              click_link "Add New About"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Abouts::About.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:about, :name => "A name") }

          it "should succeed" do
            visit refinery.abouts_admin_abouts_path

            within ".actions" do
              click_link "Edit this about"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:about, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.abouts_admin_abouts_path

            click_link "Remove this about forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Abouts::About.count.should == 0
          end
        end

      end
    end
  end
end
