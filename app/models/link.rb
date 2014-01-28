# == Schema Information
#
# Table name: links
#
#  id            :integer          not null, primary key
#  full_link     :string(255)
#  random_string :string(255)
#  visits        :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Link < ActiveRecord::Base
	

	
end
