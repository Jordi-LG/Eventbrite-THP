class Admin::UsersController < ApplicationController
  layout 'admin'
  #EMPECHER LE USER D'ALLER SUR UNE AUTRE PAGE PROFIL QUE LA SIENNE
  before_action :authenticate_user!, :is_admin?

  def index
    @user = User.all
  end


private

end
