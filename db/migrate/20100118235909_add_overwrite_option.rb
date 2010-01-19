class AddOverwriteOption < ActiveRecord::Migration
  class Repository < ActiveRecord::Base
  end

  def self.up
    add_column :repositories, :checkout_url_overwrite, :boolean, :default => false, :null => false
    
    # existing repositories are set to overwrite the default settings
    # This is to keep continuity of settings.
    Repository.all.each{|r| r.update_attribute(:checkout_url_overwrite, true)}
  end
  
  def self.down
    remove_column :repositories, :checkout_url_overwrite
  end
end
