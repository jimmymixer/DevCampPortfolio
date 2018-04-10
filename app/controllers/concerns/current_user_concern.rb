module CurrentUserConcern
  extend ActiveSupport::Concern

  # Override current_user
  def current_user
    # If there is a current user, act as normal, call on its parent method || null object pattern
    super || guest_user
    # If super then run as normal or call its parent method|| this side doesnt run
    # If not super then || run the OpenStruct.new
  end

  def guest_user
    # Commented this out because it causes bugs with Petergate Gem
    # OpenStruct.new(name: "Guest User",
    #               first_name: "Guest",
    #               last_name: "User",
    #               email: "guest@example.com"
    #             )
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guest@example.com"
    guest
  end
end
