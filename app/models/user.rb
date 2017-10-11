class User < ApplicationRecord
  has_secure_password
  has_many :transfers

  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :address_line_1, presence: true, length: { maximum: 50 }
  validates :dob, presence: true

  def name
    first_name + " " + last_name
  end

  def age
    Date.today.year - dob.year
  end

  def as_json(options = {})
    super(options.merge({ only: [:username, :address_line_1], methods: [:age, :name] }))
  end
end
