# module to identify from where was the link started
module DefaultPageTitle
  extend ActiveSupport::Concern

  included do
    before_action :set_page_title
  end

  def set_page_title
    @page = 'Sergio Torres'
  end
end
