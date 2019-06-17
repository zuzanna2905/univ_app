class StudentsController < ApplicationController
    before_action :set_student, only: [:edit, :show, :update]
    
    def index
        @students = Student.all
    end

    def new
        @student = Student.new
    end

    def show
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

    def edit
    end

    def update 
        if @student.update(student_parms)
            flash[:success] = 'You have successfully updated your profile'
            redirect_to student_path(@student)
        else
            render 'edit'
        end
    end

    private
    def set_student
        @student = Student.find(params[:id])
    end

    def student_parms
        params.require(:student).permit(:name, :email)
    end
end