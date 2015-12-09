# The ability class defines what users can and cannot do, as per the
# CanCan documentation. The permissions in the file are broken up into
# methods, one per role.
#
# This class should never be used directly. Cancancan handles this
# when it needs to authorize a user.
#
# @see User
# @see https://github.com/CanCanCommunity/cancancan/wiki/defining-abilities
class Ability
  include CanCan::Ability
  attr_reader :core_models
  # @!attribute core_models [r]
  # A list of models which are core elements. This includes elements
  # which are Site functionality such as the Person and CaseFile
  # models.

  attr_reader :user_models
  # @!attribute user_models [r]
  # A list of models which are core elements. This includes elements
  # which are support functionality, such as User.

  # When initialized the class will load permissions for each of the
  # roles the user has, if the user is nil then a "new" User will be
  # created with no roles.
  # @param user [User] The current user of the site.
  def initialize(user)
    @core_models = [CaseFile, Person, Event]
    @user_models = [User]
    @user = user || User.new

    can :manage, Home
    can :read, @core_models
    load_unauthenticated_permissions if @user.new_record?
    load_user_permissions if @user.user?
    load_moderator_permissions if @user.moderator?
    load_researcher_permissions if @user.researcher?
    load_admin_permissions if @user.admin?
  end

  private

  # Permissions for unauthenticated (new) users
  def load_unauthenticated_permissions
    can :create, User
    can :create, Session
  end

  # Permissions for administrative user. This should be =can :manage,
  # :all=. So that the admin is never locked out of doing something (a
  # number of tests rely on this).
  def load_admin_permissions
    can :manage, :all
  end

  # Permissions for moderators
  def load_moderator_permissions
    can [:promote, :show, :update, :create, :destroy], @user_models
  end

  # Permissions for researchers
  def load_researcher_permissions
    can [:update, :create, :destroy], @core_models
  end

  # Permissions for Users all users should have this role.
  def load_user_permissions
    can [:show, :update, :destroy], User, id: @user.id
    can [:destroy], Session
  end
end
