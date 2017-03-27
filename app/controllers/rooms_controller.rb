class RoomsController < ApplicationController
  before_action :authenticate_user!
  def show
    @messages = Message.all.last(30)
  end
end
