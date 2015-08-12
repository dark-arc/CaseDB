class Ability
  include CanCan::Ability
  @@readable = [CaseFile,Person,Event]

  def initialize(user)
    user ||= User.new 

    # Set permissions
    # Everyone can read
    can :read, @@readable
    # Admin can do everything
    if user.admin?
      can :manage, :all
    end

    # 
  end
end
