# The ability class defines what users can and cannot do, as per the
# CanCan documentation
class Ability
  include CanCan::Ability
  #@attribute coreModels [r]
  # A list of models which are "core elements". 
  @@coreModels = [CaseFile,Person,Event,Link]

  # This defines the permissions for each page
  # @see http://rubydoc.info/github/ryanb/cancan/CanCan
  def initialize(user)
    user ||= User.new
    user.roles = :guest
    # Everyone can read
    can :read, @@coreModels
    can :create, User
    if [:admin,:researcher,:moderator,:user]
      can [:read, :edit], User
    end
    # Admin can do everything
    if user.admin?
      can :manage, :all
      can :promote, :user
    end
  end
end
