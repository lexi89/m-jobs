class Req < ActiveRecord::Base
  has_many :jobreqs
  has_many :jobs, through: :jobreqs
end
