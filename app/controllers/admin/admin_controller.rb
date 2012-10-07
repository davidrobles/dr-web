class Admin::AdminController < ApplicationController

  before_filter :admin_required
  layout 'dashboard'

  def index
  end

end
