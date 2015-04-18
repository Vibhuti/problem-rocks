# == Schema Information
#
# Table name: problems
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  user_id    :integer
#  category   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Problem < ActiveRecord::Base
  has_many :solutions, dependent: :destroy
  belongs_to :user
  # accepts_nested_attributes_for :solutions
end
