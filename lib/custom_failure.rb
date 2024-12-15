# deviseでのログイン失敗時の処理カスタム
class CustomFailure < Devise::FailureApp
  def redirect_url
    home_index_url # ログイン失敗したらトップページにリダイレクト
  end

  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end
