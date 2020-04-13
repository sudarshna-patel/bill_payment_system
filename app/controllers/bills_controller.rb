class BillsController < ApplicationController
  before_filter :authenticate_request!

  def fetch_bills
    bills = Bill.where("customer ? :attributeName", key: params[customerIdentifiers].first['attributeName'])
                .where("customer ? :attributeValue", key: params[customerIdentifiers].first['attributeValue'])
    if !@current_user
      render json: {
        status: 404,
        success: false,
        error: {
          code: "customer-not-found",
          title: "Customer not found",
          traceID: "",
          description: "The requested customer was not found in the biller system.",
          param: "",
          docURL: "",
        }
      }
    elsif @current_user && bills.empty?
      render json: {
        status: 200,
        success: true,
        data: {
          customer: { name: @current_user.name },
          billDetails: {
            billFetchStatus: "NO_OUTSTANDING",
            bills: []
          }
        }
      }
    else
      render json: {
        status: 200,
        success: true,
        data: {
          customer: { name: @current_user.name },
          billDetails: {
            billFetchStatus: "AVAILABLE",
            bills: bills.map { |b| bill_obj(b) }
          }
        }
      }
    end
  end

  def fetch_receipt
    # @current_user
    receipt = BillReceipt.create!(billerBillID: params[:billerBillID],
                                  platformBillID: params[:platformBillID],
                                  platformTransactionRefID: params[:paymentDetails]['platformTransactionRefID'],
                                  uniquePaymentRefID: params[:paymentDetails]['uniquePaymentRefID'])
    # need to update existing bill
    Bill.where(billerBillID: params[:billerBillID]).update_attributes!()
    render json: {
      status: 200,
      success: true,
      data: {
        billerBillID: receipt.billerBillID,
        platformBillID: receipt.platformBillID,
        platformTransactionRefID: receipt.platformTransactionRefID,
        receipt: {
          id: receipt.id,
          date: receipt.created_at
        }
      }
    }
  rescue
    render json: {
      status: 404,
      success: false,
      error: {
        errors: [{
          code: "string",
          detail: "string",
          docURL: "string",
          title: "string" }],
        traceID: "string",
        code: "string",
        detail: "string",
        docURL: "string",
        title: "string"
      }
    }
  end

  private

  def bill_obj(bill)
    {
      billerBillID: bil.billerBillID,
      generatedOn: bill.created_at,
      recurrence: bill.recurrence,
      amountExactness: bill.amountExactness,
      customerAccount: bill.customerAccount,
      aggregates: bill.aggregates
    }
  end
end
