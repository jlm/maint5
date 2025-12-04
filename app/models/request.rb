class Request < ApplicationRecord
  belongs_to :item
  validates :standard, presence: true, length: { in: 3..50 }
  # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
