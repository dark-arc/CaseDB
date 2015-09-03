# The ability class defines what users can and cannot do, as per the
# CanCan documentation
class Ability
  include CanCan::Ability
  #@attribute coreModels [r]
  # A list of models which are "core elements". 
  @@coreModels = [CaseFile,Person,Event]

  def initialize(user)
    user ||= User.new
    
    can :read, @@coreModels
    can [:read, :update, :destroy], User, :id => user.id
    
    if user.guest?
      can :create, User
    end

    if user.user?
      
    end
    
    if user.moderator?

    end

    if user.researcher?
      can [:update,:create], @@coreModels
    end

    if user.admin?
      can :manage, :all
    end
  end
end
