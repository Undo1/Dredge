class AddLinksAndDomainsToComment < ActiveRecord::Migration
  def change
    add_column :comments, :links, :text
    add_column :comments, :domains, :text
  end
end
