class VerificationMailer < ApplicationMailer

  def verify_account(user)
    @user = user
    @auth_key = user.auth_token

    if @user
      mail(to: @user.email, subject: "Verify Your Heart Companion Account")
    end
  end

end
