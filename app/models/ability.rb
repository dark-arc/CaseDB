# The ability class defines what users can and cannot do, as per the
# CanCan documentation
class Ability
  include CanCan::Ability
  #@attribute coreModels [r]
  # A list of models which are "core elements". 
  def initialize(user)
    @coreModels = [CaseFile,Person,Event]
    @userModels = [User]

    user ||= User.new
    
    can :read, @coreModels
    can [:show, :update, :destroy], User, :id => user.id
    
    if user.new_record?
      can :create, User
    end

    if user.user?
      
    end
    
    if user.moderator?
      can [:promote,:show,:update,:create,:destroy], @userModels
    end

    if user.researcher?
      can [:update,:create,:destroy], @coreModels
    end

    if user.admin?
      can :manage, :all
    end
  end
end
