# == Schema Information
#
# Table name: solutions
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  problem_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Solution < ActiveRecord::Base
  belongs_to :problem
end
