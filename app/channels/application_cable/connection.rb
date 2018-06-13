module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # ActionCable and Web Sockets do not have the same access points as RHTTP connections
    # Here we re-create current_user
    identified_by :current_user

    def guest_user
      guest = GuestUser.new
      guest.id = guest.object_id  # .object_id is an object in memory
      guest.name = "Guest User"
      guest.first_name = "Guest"
      guest.last_name = "User"
      guest.email = "guest@user.com"
      guest
    end

    def connect
      self.current_user = find_verified_user || guest_user
      logger.add_tags 'ActionCable', current_user.email
      logger.add_tags 'ActionCable', current_user.id
    end

    protected

    def find_verified_user
      if verified_user = env['warden'].user
        verified_user
      end
    end

  end
end
