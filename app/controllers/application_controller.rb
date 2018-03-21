class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include SetCurrentUser
  include DefaultPageTitle

  before_action :copyright

  def copyright
    @copyright = SergioTorresGem::Renderer
                 .copyright('Sergio Torres', 'Todos los derechos reservados')
  end
end
