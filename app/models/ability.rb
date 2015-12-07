# The ability class defines what users can and cannot do, as per the
# CanCan documentation
class Ability
  include CanCan::Ability
  # @attribute coreModels [r]
  # A list of models which are "core elements".
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

  def load_unauthenticated_permissions
    can :create, User
    can :create, Session
  end

  def load_admin_permissions
    can :manage, :all
  end

  def load_moderator_permissions
    can [:promote, :show, :update, :create, :destroy], @user_models
  end

  def load_researcher_permissions
    can [:update, :create, :destroy], @core_models
  end

  def load_user_permissions
    can [:show, :update, :destroy], User, id: @user.id
    can [:destroy], Session
  end
end
