class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @resource = User.new
    @resource_name = :user
    @devise_mapping = Devise.mappings[:user]
  end
end
