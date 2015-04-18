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

require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
