class Jobreq < ActiveRecord::Base
  belongs_to :job
  belongs_to :req
end
