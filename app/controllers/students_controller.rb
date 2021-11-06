class StudentsController < ApplicationController

    def index
        student = Student.all
        render json: student

    end

    def create
        new_student = Student.create(student_params)
        render json: new_student

    end

    def update
        update_student = Student.update(student_params)
        render json: update_student

    end

    def destory
        student = Student.find(params[:id])
        student.destroy

    end

    private

    def new_student
        params.permit(:name, :major, :age, :instructor_id)
    end

end
