class User < ActiveRecord::Base
#  attr_accessible :name, :real_name, :email, :password, :password_confirmation
  validates :name, :presence => true, :uniqueness => true

  validates :password, :confirmation => true

  validate  :password_must_be_present

  has_and_belongs_to_many :roles
  has_and_belongs_to_many :positions

  has_many :notices

  has_many :send_messages, :class_name=>"Message", :foreign_key=>"sender", :extend => MessageTypeFinder

  has_many :message_receivers
  has_many :receive_messages, :through => :message_receivers do
    def communicate_messages
      where('messages.type == ?', "CommunicateMessage")
    end
    def prompt_messages
      where('messages.type == ?', "PromptMessage")
    end
    def unread
      where('message_receivers.state == ?', "unread")
    end
  end

  has_many :send_applications, :class_name=>"Application", :foreign_key=>"sender", :extend => ApplicationTypeFinder

  has_many :application_receivers
  has_many :receive_applications, :through => :application_receivers do
    def pending
      where('application_receivers.state == ?', 'pending')
    end
  end

  scope :search_for_real_name, lambda{|q| {:conditions => ['real_name LIKE ?', "%#{q}%"]}}

  def User.authenticate(name, password)
    if user = find_by_name(name)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
  end

  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "wibble" + salt)
  end

  def User.find_ids_by_real_names(real_names)
    ids = []
    real_names.each do |real_name|
      u = User.find_by_real_name(real_name)
      ids << u.id   if (u)
    end
    ids
  end

  # 'password' is a virtual attribute
  def password=(password)
    @password = password

    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end

  def password

  end

  def password_confirmation

  end

  def password_confirmation=(password)

  end

  def can?(action, resource)
    roles.includes(:rights).for(action, resource).any?
  end

  after_destroy :ensure_an_admin_remains

  def ensure_an_admin_remains
    if User.count.zero?
      raise "Can't delete last user_module"
    end
  end

  private

    def password_must_be_present
      errors.add(:password, "Missing password") unless hashed_password.present?
    end

    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end
end
