class CustomersController < ApplicationController
  before_action :set_customer, only: [:add_to_black_list, :delete_from_black_list, :edit, :update]

  def index
    @customers = Customer.where(black_list_added: false)
  end

  def black_list
    @customers = Customer.where(black_list_added: true)
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path
    end
  end

  def add_black_list_on_phone
    @customer = Customer.find(params[:phone])
    if @customer.present?
      @customer.add_to_black_list
      if @customer.save
        redirect_to bl_customers_path
      end
    else
      # create new
    end
  end

  def add_to_black_list
    @customer.add_to_black_list
    if @customer.save
      redirect_to bl_customers_path
    end
  end

  def delete_from_black_list
    @customer.delete_from_black_list
    if @customer.save
      redirect_to customers_path
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:phone, :name, :description)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
