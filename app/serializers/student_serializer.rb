class StudentSerializer < ActiveModel::Serializer
  attributes :name, :major, :age, :student_details

  has_one :instructor

  def student_details
    "#{self.object.name} is #{self.object.age} and is majoring in #{self.object.major}"
  end

end
