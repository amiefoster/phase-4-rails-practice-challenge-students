class InstructorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found  
    rescue_from ActiveRecord::RecordInvalid, with: :not_valid


    def index
    instructor = Instructor.all
    render json: instructor

    end

    def create
        new_instructor = Instructor.create!(instructor_params)
        render json: new_instructor, status: :created

    end

    def update

        update_instructor = Instructor.find(params[:id]).update(instructor_params)
        render json: update_instructor

    end

    def destroy
    instructor = Instructor.find(params[:id])
    instructor.destroy

    end

    private

    def instructor_params
        params.permit(:name)
    end

    def not_found(e) #THIS ALWAYS TAKES IN AN EVENT
        render json: { error: e.message }, status: :not_found
    end

    def not_valid
        render json: { error: "Instructor not found" }, status: :not_found

    end

end
