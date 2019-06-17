class LoginsController < ApplicationController
    skip_before_action :require_user, only: [:new, :create]
    def new
    end

    def create
        student = Student.find_by(email: params[:logins][:email].downcase)
        if student && student.authenticate(params[:logins][:password])
            session[:student_id] = student.id
            flash.now[:success] = 'You have successfully logged in'
            redirect_to student_path(student)
        else
            flash.now[:success] = 'Something was wrong with your login information'
            render 'new'
        end
    end

    def destroy
        session[:student_id] = nil
        flash[:success] = 'You have successfully logged out'
        redirect_to root_path
    end

end