class BillsController < ApplicationController
  before_filter :authenticate_request!

  def fetch_bills
    # @current_user
    render json: {
      status: 200,
      success: true,
      data: {}
    }
  end

  def fetch_receipt
    # @current_user
    render json: {
      status: 200,
      success: true,
      data: {}
    }
  end
end
