class Api::V1::ProfilesController < Api::V1::ApiController
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
  # Using a private method to encapsulate the permissible parameters
  # is just a good pattern since you'll be able to reuse the same
  # permit list between create and update. Also, you can specialize
  # this method with per-user checking of permissible attributes.
    def profile_params
        params.require(:profile).permit(:nickname, :age, :major, :enterYear)
    end
end