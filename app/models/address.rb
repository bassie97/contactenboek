class Address < ActiveRecord::Base
  belongs_to :contact
  validates :zip_code, presence: true, format: { with: /[1-9][0-9]{3}[a-zA-Z]{2}/}
  validates :street, presence: true
  def full_address
    address = []
    address << country if country.present?
    address << city if city.present?
    address << zip_code if zip_code.present?
    address << street if street.present?
    address << house_number if house_number.present?
    address.join(', ')
  end
end


