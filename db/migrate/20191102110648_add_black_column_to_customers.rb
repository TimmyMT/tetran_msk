class AddBlackColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :black_list_added, :boolean, default: false
  end
end
