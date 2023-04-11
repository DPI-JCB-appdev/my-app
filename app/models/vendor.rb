# == Schema Information
#
# Table name: vendors
#
#  id              :integer          not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Vendor < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  has_many(:promotions, { :class_name => "Promotion", :foreign_key => "vendor_id", :dependent => :destroy })
end
