class StudentsController < ApplicationController
    def index
        @students = Student.all
    end

    def new
        @student = Student.new
    end

    def show
        @student = Student.find(params[:id])
    end

    def create 
        @student = Student.new(student_parms)
        if @student.save
            flash[:success] = 'You have successfully signed up!'
            redirect_to student_path(@student)
        else
            render 'new'
        end
    end

    private
    def student_parms
        params.require(:student).permit(:name, :email)
    end
end