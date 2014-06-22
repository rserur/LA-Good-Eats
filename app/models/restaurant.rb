class Restaurant < ActiveRecord::Base
  has_many :reviews
  belongs_to :category

  validates :name,
    presence: true
  validates :address,
    presence: true
  validates :city,
    presence: true
  validates :zip,
    presence: true
  validates_format_of :zip,
    with: /\A\d{5}-\d{4}|\A\d{5}\z/,
    :message => "should be in format of 12345 or 12345-1234"

end
