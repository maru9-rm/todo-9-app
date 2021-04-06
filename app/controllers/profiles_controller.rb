class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def show
        @profile = current_user.profile
    end

    def edit
        @profile = current_user.build_profile
    end

    def update
        @profile = current_user.build_profile(profile_params)
        if @profile.save
            redirect_to root_path, notice: 'Successfully saved'
        else
            flash.now[:error] = 'Failed to save'
            render :edit
        end
    end


    private
    def profile_params
        params.require(:profile).permit(:name,:avatar)
    end

end