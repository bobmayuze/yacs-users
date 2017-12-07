class Api::V1::ProfilesController < Api::V1::ApiController
  before_action :require_login

  def show
    # user = User.find(params[:id])
    profile = Profile.find_by(user_id: params[:id])
    render json: profile.as_json()
  end

  def update
    profile = Profile.find_by(user_id: params[:id])
    profile.update!(profile_params)
    render status: 200, json: profile.to_json
  end

  private
  def require_login
    token_session = Yacs::Auth::Session.get_session_from_token(params[:token])
    token_session[:token]['sub'] == params[:id]
  end

  def profile_params
      params.require(:profile).permit(:nickname, :age, :major, :enterYear)
  end
end