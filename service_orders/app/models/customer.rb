class Customer < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true

  def self.create_or_update_from_bunny(payload)
    customer = find_or_initialize_by(email: payload["email"])
    customer.assign_attributes(
      name: payload["name"],
      identification_code: payload["identification_code"]
    )
    customer.save!
  end
end
