class Transfer < ApplicationRecord
  belongs_to :user

  validates :account_number_from, presence: true, length: { is: 18 }
  validates :account_number_to, presence: true, length: { is: 18 }
  validates :amount_pennies, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :country_code_from, presence: true, length: { is: 3 }
  validates :country_code_to, presence: true, length: { is: 3 }

  def as_json(options = {})
    super(options.merge({ only: [:account_number_from, :account_number_to, :amount_pennies, :country_code_from, :country_code_to] }))
  end
end
