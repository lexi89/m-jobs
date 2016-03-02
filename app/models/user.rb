class User < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  ROLES = %w[admin user]
  has_many :userskills
  has_many :skills, through: :userskills
  accepts_nested_attributes_for :skills
  has_many :interests, foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :interests, source: :followed
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def follow(company)
  	interests.create(followed_id: company.id)
  end

  def unfollow(company)
  	interests.find_by(followed_id: company.id).destroy
  end

  def following?(company)
  	following.include?(company)
  end

end
