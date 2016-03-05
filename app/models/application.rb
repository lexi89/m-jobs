class Application < ActiveRecord::Base
  belongs_to :applicant, class_name: "User"
  belongs_to :job
end
