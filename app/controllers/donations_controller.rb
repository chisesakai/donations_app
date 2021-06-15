class DonationsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
  end
  def new
    @donation_address = DonationAddress.new
  end
  def create
    @donation_address = DonationAddress.new(donation_address_params)
    if @donation_address.valid?
      @donation_address.save
      redirect_to :root
    else
      render :new
    end
  end

  private
  def donation_address_params
    params.require(:donation_address).permit(:price, :postal_code, :prefecture, :city, :house_number, :building_name).merge(user_id: current_user.id)
  end
end
