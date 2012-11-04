class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  before_filter :load_channels

  protect_from_forgery

  private

  def load_channels
    if current_user
      @channels = current_user.channels
    end
  end
end
