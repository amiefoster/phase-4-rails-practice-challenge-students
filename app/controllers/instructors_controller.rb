class InstructorsController < ApplicationController

    def index
    instructor = Instructor.all
    render json: instructor

    end

    def create
        new_instructor = Instructor.create(instructor_params)
        render json: new_instructor

    end

    def update
        update_instructor = Instructor.update(instructor_params)
        render json: update_instructor

    end

    def destory
    instructor = Instructor.find(params[:id])
    instructor.destroy

    end

    private

    def instructor_params
        params.permit(:name)
    end

end
