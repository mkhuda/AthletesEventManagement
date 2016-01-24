class Athlete < ActiveRecord::Base
	has_many :trans
	has_many :events, through: :trans
end
