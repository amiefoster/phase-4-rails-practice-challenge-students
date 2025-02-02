class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :not_valid

    def index
        student = Student.all
        render json: student
    end

    def create
        new_student = Student.create!(student_params)
        render json: new_student, status: :created
    end

    def update
        update_student = Student.find(params[:id]).update(student_params)
        render json: update_student, status: :ok
    end

    def destroy
        student = Student.find(params[:id])
        student.destroy
    end

    private

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

    def not_found #THIS ALWAYS TAKES IN AN EVENT
        render json: { error: "Student not found" }, status: :not_found
    end

    def not_valid(e)
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end


end
