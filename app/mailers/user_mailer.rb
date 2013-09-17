class UserMailer < ActionMailer::Base
  default from: "thingamajig@appacademy.io"


  def password_reset_email(user)
    @user = user
    @url =  url_for(host: 'localhost:3000',
                controller: 'users',
                action: 'reset',
                email: user.email,
                reset_token: user.reset_token
                )

    # @url  = "#{reset_users_url(:3000)}?email=#{user.email}&reset_token=#{@user.reset_token}"

    mail(to: user.email, subject: 'Reset your password')
  end

end
