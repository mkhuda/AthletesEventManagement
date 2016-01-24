class Event < ActiveRecord::Base
	has_many :trans
	has_many :athletes, through: :trans
end
