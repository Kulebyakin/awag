class WarehouseTransferController < ApplicationController

  def new
    @transfer_start = TransferStart.new
  end

  def create
    @transfer_start = TransferStart.new(warehouse_transfer_params)

    if @transfer_start.valid?
      session[:transfer_start] = {
        'from_warehouse' => @transfer_start.from_warehouse,
        'to_warehouse' => @transfer_start.to_warehouse
      }
    redirect_to new_transfer_path
    else
      render :new
    end
  end

  private

  def warehouse_transfer_params
    params.permit(:authenticity_token, :commit, transfer_start: [:from_warehouse, :to_warehouse]).require(:transfer_start)
  end
end
