class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryMailer.send_mail(@inquiry).deliver_now # モデルに保存できたらsend_mailメソッドを使用して即座（deliver_nowメソッド）にメールを送信
      redirect_to user_main_index_path(current_user.id), notice: "お問い合わせが完了しました。"
    else
      render :new
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:customer_name, :customer_email, :inquiry_message)
  end
end
