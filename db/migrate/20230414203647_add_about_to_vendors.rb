class AddAboutToVendors < ActiveRecord::Migration[6.0]
  def change
    add_column :vendors, :about, :string
  end
end
