class InquiryMailer < ApplicationMailer
  # メールを送信するためのメソッド
  def send_mail(inquiry) # inquiryモデルを引数として渡す。
    @inquiry = inquiry
    mail to:   ENV['TO_MAIL'], subject: '【お問い合わせ】'
  end
end
