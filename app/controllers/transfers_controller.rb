class TransfersController < ApplicationController
  before_action :auth_check
  before_action :set_transfer, only: [:show, :update, :destroy]

  def index
    json_response(@user.transfers)
  end

  def show
    json_response(@transfer)
  end

  def create
    @transfer = @user.transfers.create!(transfer_params)
    json_response(@transfer, :created)
  end

  def update
    @transfer.update(transfer_params)
    head :no_content
  end

  def destroy
    @transfer.destroy
    head :no_content
  end

  def transfer_params
    params.permit(:account_number_from, :account_number_to, :amount_pennies, :country_code_from, :country_code_to)
  end

  def set_transfer
    @transfer = @user.transfers.find_by!(id: params[:id]) if @user
  end
end
