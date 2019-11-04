class AttendanceMailer < ApplicationMailer

  default from: 'no-reply@testeur.com'

  def user_join_event(attendance)
    @attendance = attendance
    @attendance_user = User.find(@attendance.user_id)
    @attendance_event = @attendance.event
    @admin = User.find(@attendance.event.admin_id)
    @url = 'https://git.heroku.com/whispering-citadel-71305.git/login' # à utiliser dans la view
    mail(to: @admin.email, subject: "Un utilisateur à rejoint l'évenement !")
  end

end
