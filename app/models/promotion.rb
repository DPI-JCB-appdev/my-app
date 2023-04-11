# == Schema Information
#
# Table name: promotions
#
#  id          :integer          not null, primary key
#  description :text
#  ended_at    :datetime
#  started_at  :datetime
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  vendor_id   :integer
#
class Promotion < ApplicationRecord
  has_many(:bookmarks, { :class_name => "Bookmark", :foreign_key => "promotion_id", :dependent => :destroy })
  belongs_to(:vendor, { :required => true, :class_name => "Vendor", :foreign_key => "vendor_id" })
end
