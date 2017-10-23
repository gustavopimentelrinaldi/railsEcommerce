class SiteController < ApplicationController
  layout 'site'
  def home
    @categories = Category.order_by_description
    @ads = Ad.descending_order(6)
  end
end
