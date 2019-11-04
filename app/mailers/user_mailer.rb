class UserMailer < ApplicationMailer
default from: 'no-reply@testeur.com'

def welcome_email(user)
  @user = user
  @url = 'https://git.heroku.com/whispering-citadel-71305.git/login' # à utiliser dans la view
  mail(to: @user.email, subject: "Bienvenue à toi !")
end

end
