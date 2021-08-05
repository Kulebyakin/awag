class TransferController < ApplicationController
  before_action :get_hash_of_transfers, only: :index

  def index
  end

  def new
    @products = Product.order(title: :asc)
    @from_warehouse = Warehouse.find(session['transfer_start']['from_warehouse'])
    @to_warehouse = Warehouse.find(session['transfer_start']['to_warehouse'])
    @transfer = Transfer.new
  end

  def create
    @transfer = Transfer.create!(transfer_params)
    if @transfer.each { |transfer| transfer.save }
      session.delete('transfer_start')
      redirect_to transfer_index_path
    else
      render :new, alert: "Error"
    end
  end

  private

  def get_hash_of_transfers
    @transfers = Transfer.order(created_at: :desc)
    @transfers_datetime = []
    @result = {}

    size = 0
    @transfers.each_with_index do |trans, i|
      size += 1 if trans.created_at.round(0) != @transfers[i-1].created_at.round(0)
    end
    if @transfers.any? && size == 0
      size = 1
    end

    @transfers.each_with_index do |tdt, i|
      if size > 1
        @transfers_datetime << tdt.created_at if @transfers[i].created_at.round(0) != @transfers[i-1].created_at.round(0)
      elsif size == 1
        @transfers_datetime[0] = tdt.created_at
      end
    end

    @transfers_datetime.each_with_index do |tdt, i|
      @result[tdt] = {}
      @result[tdt][:product_amount] = []
      @transfers.each do |transfer|
        if tdt.round(0) == transfer.created_at.round(0)
          @result[tdt][:from_warehouse] = transfer.from_warehouse.title
          @result[tdt][:to_warehouse] = transfer.to_warehouse.title
          @result[tdt][:product_amount] << "#{Product.find(transfer.product_id).title}: #{transfer.amount}"
        end
      end 
    end
  end

  def transfer_params
    params.permit(:authenticity_token, :commit, transfer: [:from_warehouse_id, :to_warehouse_id, :amount, :product_id]).require(:transfer)
  end
end
