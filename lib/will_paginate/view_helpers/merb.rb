require 'will_paginate/view_helpers/base'
require 'will_paginate/view_helpers/link_renderer'

# Merb gives you a Merb::Plugins.config hash...feel free to put your stuff in your piece of it
Merb::Plugins.config[:paging] = {
  :class          => 'pagination',
  :previous_label => '&laquo; Previous',
  :next_label     => 'Next &raquo;',
  :inner_window   => 4, # links around the current page
  :outer_window   => 1, # links around beginning and end
  :separator      => ' ', # single space is friendly to spiders and non-graphic browsers
  :param_name     => :page,
  :params         => nil,
  :renderer       => 'WillPaginate::ViewHelpers::LinkRenderer',
  :page_links     => true,
  :container      => true
}


WillPaginate::ViewHelpers::LinkRenderer.class_eval do
  protected

  def url(page)
    params = @template.request.params.except(:action, :controller).merge('page' => page)
    @template.url(:this, params)
  end
end

Merb::AbstractController.send(:include, WillPaginate::ViewHelpers::Base)
