require 'role_model'
require 'digest/sha1'

class User < ActiveRecord::Base
  include RoleModel
  before_save :encrypt_password,:check_roles
  after_save :clear_password
  
  attr_accessor :password

  validates :username,
            :presence => true,
            :uniqueness => true
  validates :email,
            :uniqueness => true
  validates :password,
            :confirmation => true
  validates :password_confirmation,
            :presence => true,
            unless: Proc.new {|a| a.password.blank?}
  validates_length_of :password,
                      :in => 10..50,
                      :on => :create
  validate :validate_theme

  roles_attribute :roles_mask
  roles :admin, :researcher, :moderator,:user, :guest

  def check_roles
    if(! roles.include? :user)
      roles << :user
    end
  end
  def self.authenticate(username="", password="")
    user = User.find_by_username(username)
    if user && user.verify_password(password)
      return user
    end
    return false
  end
  def verify_password(password = "")
    password_enc==encrypt("#{username}#{password}")    
  end
  def validate_theme
    unless (User.themes.include?(theme) or theme == nil)
      themes = User.themes.to_sentence(two_words_connector: " or ",
                                       last_word_connector: " or ")
      errors.add(:theme, "must be one of #{themes}") 
    end
  end
  # Gets a list of valid themes that the user can select from.
  #
  # @return [Array<String>]
  def self.themes
    Dir.glob("app/assets/stylesheets/themes/*.scss").
      map{|t| File.basename(t, '.scss')} 
  end
  protected
  attr_writer :name, :password_enc
  def encrypt_password
    if password.present?
      dig = encrypt("#{username}#{password}")
      write_attribute(:password_enc, dig)
    end
  end
  def clear_password
    self.password = nil
  end
  def encrypt(password = "")
    Digest::SHA1.hexdigest(password)
  end
end
