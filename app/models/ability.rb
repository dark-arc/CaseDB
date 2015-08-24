# The ability class defines what users can and cannot do, as per the
# CanCan documentation
class Ability
  include CanCan::Ability
  #@attribute coreModels [r]
  # A list of models which are "core elements". 
  @@coreModels = [CaseFile,Person,Event,Link]

  def initialize(user)
    user ||= User.new
    user.roles = :guest
    # Everyone can read
    can :read, @@coreModels
    can :create, User
    if [:researcher,:moderator,:user]
      can [:read, :update], User, :id => user.id
    end
    # Admin can do everything
    if [:admin]
      can :manage, :all
      can :promote, User
    end
  end
end
