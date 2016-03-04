class User < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  ROLES = %w[admin user]
  has_many :userskills
  has_many :skills, through: :userskills
  accepts_nested_attributes_for :skills
  has_many :admins, dependent: :destroy
  has_many :companies, through: :admins
  has_many :interests, foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :interests, source: :followed
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.firstname = auth.info.name
      user.image = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def follow(company)
  	interests.create(followed_id: company.id)
  end

  def unfollow(company)
  	interests.find_by(followed_id: company.id).destroy
  end

  def following?(company)
  	following.include?(company)
  end

  def claim(company)
    admins.create(company_id: company.id)
  end

end
