class Ability
  include CanCan::Ability
  def initialize(user)
    if(user.nil?)
        can :read,  [Amenity,City,Room,AmenityRoom]
    elsif(user.role? 'admin')
        can :manage,[Amenity,City,AmenityRoom,]
        can [:read,:update], Room
        can :read , Booking  
    elsif(user.role? 'host')
        can :read, [City,Room,Amenity]
        can :create, [Amenity,Room,Booking]
        can :read , Booking do |booking|
               booking.user_id == user.id
            end
        can :update, Booking do |booking|
               booking.room.user_id == user.id
            end
    

        can [:update,:destroy], Room do |r|
            r.user_id == user.id
            end
        can :read, Booking do |booking|
             booking.user_id == user.id
             end         
    elsif(user.role? 'guest')
        can :read,[City,Amenity,AmenityRoom,Room]
        can :create,[Room,Amenity]
        can :read,Booking do |booking|
              booking.user_id == user.id
             end 
        can :create,Booking      
    end
  end             
end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
