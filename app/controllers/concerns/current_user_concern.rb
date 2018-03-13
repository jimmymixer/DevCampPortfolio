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
    OpenStruct.new(name: "Guest User",
                  first_name: "Guest",
                  last_name: "User",
                  email: "guest@example.com"
                )
  end
end
