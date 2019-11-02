class Customer < ApplicationRecord
  validates :name, :phone, :description, presence: true

  def add_to_black_list
    self.black_list_added = true
    self.save!
  end

  def delete_from_black_list
    self.black_list_added = false
    self.save!
  end

end
