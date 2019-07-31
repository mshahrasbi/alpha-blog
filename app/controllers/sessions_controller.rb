
class SessionsController < ApplicationController

    def new 

    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])

            session[:user_id] = user.id

            flash[:success] = 'You have succefully logged in'
            redirect_to user_path(user)
        else
            # flash does persist for one http request, when you redirect what is why you ee the message on that page
            # but when you rendering new it is not consider a new request.
            # so by using flash.now we only see it on the same page on render now.
            flash.now[:danger] = 'There was something wrong with your login information'
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = 'You have logged out'
        redirect_to root_path
    end
end