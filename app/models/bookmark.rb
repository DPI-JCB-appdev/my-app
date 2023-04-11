# == Schema Information
#
# Table name: bookmarks
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  promotion_id :integer
#  user_id      :integer
#
class Bookmark < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:promotion, { :required => true, :class_name => "Promotion", :foreign_key => "promotion_id" })
end
