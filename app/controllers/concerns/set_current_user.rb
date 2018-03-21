module SetCurrentUser
  extend ActiveSupport::Concern

  def current_user
    super || guest_user
  end

  def guest_user
    GuestUser.new(name: 'Sergio Torres Santander',
                  first_name: 'Sergio',
                  last_name: 'Torres',
                  email: 'storres@gamil.com')



    # OpenStruct.new(name: 'Sergio Torres Santander',
    #                first_name: 'Sergio',
    #                last_name: 'Torres',
    #                email: 'storres@gamil.com')
  end
end
