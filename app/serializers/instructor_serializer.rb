class InstructorSerializer < ActiveModel::Serializer
  attributes :name, :all_student_names

  #has_many :students

  def all_student_names
    all_names = object.students.map do |student|
      student.name
    end
    all_names
  end

end
