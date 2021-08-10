class DeliveriesController < ApplicationController
  before_action :get_warehouse
  before_action :get_hash_of_deliveries, only: :index

  def index
  end

  def new
    @delivery = @warehouse.deliveries.new
    @products = Product.order(title: :asc)
  end

  def create
    @products = Product.order(title: :asc)
    @delivery = @warehouse.deliveries.create(delivery_params)

    if @delivery.each { |delivery| delivery.save! }
      redirect_to warehouse_deliveries_path, notice: "Delivery was successfully created."
    else
      render action: :new
    end
  end

  private

  def get_hash_of_deliveries
    @deliveries = @warehouse.deliveries.order(created_at: :desc)
    @deliveries_datetime = []
    @result = {}

    size = 0
    @deliveries.each_with_index do |dels, i|
      size += 1 if dels.created_at.round(0) != @deliveries[i-1].created_at.round(0)
    end
    if @deliveries.any? && size == 0
      size = 1
    end

    @deliveries.each_with_index do |ddt, i|
      if size > 1
        @deliveries_datetime << ddt.created_at if @deliveries[i].created_at.round(0) != @deliveries[i-1].created_at.round(0)
      elsif size == 1
        @deliveries_datetime[0] = ddt.created_at
      end
    end

    @deliveries_datetime.each_with_index do |ddt, i|
      @result[@deliveries_datetime[i]] = []
      @deliveries.each do |delivery|
        if @deliveries_datetime[i].round(0) == delivery.created_at.round(0)
          @result[@deliveries_datetime[i]] << "#{Product.find(delivery.product_id).title}: #{delivery.amount}"
        end
      end 
    end
  end

  def get_warehouse
    @warehouse = Warehouse.find(params[:warehouse_id])
  end

  def delivery_params
    params.permit(:created_at, delivery: [:warehouse_id, :product_id, :amount]).require(:delivery)
  end
end
