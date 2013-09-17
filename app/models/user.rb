class User < ActiveRecord::Base
  attr_accessible :password, :email, :session_token
  attr_reader :password
  validates :password_digest, :email, :session_token, presence: true
  validates :password, length: {minimum: 6, :allow_nil => true }
  validates :email, uniqueness: true

  after_initialize :ensure_session_token

  has_many(
    :circle_memberships,
    class_name: "CircleMembership",
    foreign_key: :circle_member_id,
    primary_key: :id
  )


  has_many(
    :own_circles, # that he owns
    class_name: "Circle",
    foreign_key: :owner_id,
    primary_key: :id
  )

  has_many(
    :circles, # that he's member of
    through: :circle_memberships,
    source: :circle
  )




  def password=(value)
    @password = value
    self.password_digest = BCrypt::Password.create(value).to_s
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    @user = User.find_by_email(email)

    if @user && @user.is_password?(password)
      @user
    else
      nil
    end
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end

  def send_reset_email

  end

  def generate_new_password

  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end


end
