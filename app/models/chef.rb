class Chef < ActiveRecord::Base
  has_many :recipes
  has_many :likes
  before_save :email_to_downcase
  validates :chefname, :email, presence: true, length: {minimum: 5, maximum: 250}
  validates :email, uniqueness: {case_sensitive: false},
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  
  has_secure_password
              
  def email_to_downcase
    self.email = email.downcase
  end
end