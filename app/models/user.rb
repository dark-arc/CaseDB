require 'role_model'
require 'digest/sha1'
# Users represent the site's userbase. The purpose of this model is
# primarily authentication, however, it does also allow for
# configuration of settings on a per-user basis.
#
# Users will have roles assigned which will allow or disallow them
# access to parts of the site.
#
# @see Session
# @see Ability
class User < ActiveRecord::Base
  include RoleModel
  before_save :encrypt_password, :check_roles
  after_save :clear_password

  # @!attribute [r] name
  # The users name.

  # @!attribute [rw] email
  # The email address of the user.

  # @!attribute [rw] theme
  # The style (CSS) to load for this user.

  # @attribute [w] password
  # Used to set the user's password. This will only be populated when
  # creating a user or updating their password and it will be unset
  # once the password has been updated. This cannot be used to view
  # the user's password.
  attr_accessor :password

  validates :username,
            presence: true,
            uniqueness: true
  validates :email,
            uniqueness: true
  validates :password,
            confirmation: true
  validates :password_confirmation,
            presence: true,
            unless: proc { |a| a.password.blank? }
  validates_length_of :password,
                      in: 10..50,
                      on: :create
  validate :validate_theme
  # @!attribute roles_mask
  # The roles mask is a bitmask which allows roles to be assigned to a
  # user. This should never be used directly. See {User.roles} method.
  # @return [Integer] bitmask
  roles_attribute :roles_mask
  # @!attribute roles
  # @return [Array<Symbol>] a list of roles that this user has attached to them.
  roles :admin, :researcher, :moderator, :user, :guest

  # Ensures that the users roles include :user. This is called by
  # before_save.
  def check_roles
    roles << :user unless roles.include? :user
  end

  # Attempts to authenticate a user. This should be called when a
  # login is attempted to ensure that the user has the correct
  # username and password.
  # @return [User] the authenticated user
  # @return [False] if the attempt failed.
  def self.authenticate(auth = {})
    return false if auth['username'].nil?
    return false if auth['password'].nil?
    user = User.find_by_username(auth['username'])
    return user if user && user.verify_password(auth['password'])
    false
  end

  # Verify that the given password is correct for the current user.
  # @return [True] if the password matches
  # @return [False] if the password does not match
  def verify_password(password = '')
    password_enc == encrypt("#{username}#{password}")
  end

  # Validates that the theme requested by the user is a currently
  # available CSS file.
  def validate_theme
    return if User.themes.include?(theme) || theme.nil?
    themes = User.themes.to_sentence(two_words_connector: ' or ',
                                     last_word_connector: ' or ')
    errors.add(:theme, "must be one of #{themes}")
  end

  # Gets a list of valid themes that the user can select from.
  # @return [Array<String>]
  def self.themes
    Dir.glob('app/assets/stylesheets/themes/*.scss')
      .map { |t| File.basename(t, '.scss') }
  end

  protected

  # @!attribute [rw] password_enc
  # The encrypted password for this user.
  attr_writer :name, :password_enc

  # Encrypts a new password and sets the value of password_enc
  def encrypt_password
    return unless password.present?
    dig = encrypt("#{username}#{password}")
    self[:password_enc] = dig
  end

  # Set password to nil
  def clear_password
    self.password = nil
  end

  # Encrypts the password
  # @param [String] password
  # @return [String] Encrypted(password)
  def encrypt(password = '')
    Digest::SHA1.hexdigest(password)
  end
end
