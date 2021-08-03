class TransferController < ApplicationController
  def index
  end

  def new
    @products = Product.order(title: :asc)
    @from_warehouse = Warehouse.find(session['transfer_start']['from_warehouse'])
    @to_warehouse = Warehouse.find(session['transfer_start']['to_warehouse'])
    @transfer = TransferFinish.new
  end

  def create
    # @transfer_finish = TransferFinish.new(transfer_params)
    # if @transfer_finish.valid?
    #   full_params = fransfer_finish_params.merge(
    #     from_warehouse: session['transfer_start']['from_warehouse'],
    #     to_warehouse: session['transfer_start']['to_warehouse']
    #   )

      @transfer = Transfer.create(transfer_params)
      if @transfer.each { |transfer| transfer.save }
      # if @transfer.save
        session.delete('transfer_start')
        redirect_to warehouse_transfer_index_path
      else
        render :new, alert: "Error"
      end

    # else
    #   render :new
    # end
  end

  private

  def transfer_params
    params.permit(transfer_finish: [:from_warehouse, :to_warehouse, :amount, :product_id]).require(:transfer_finish)
  end
end
