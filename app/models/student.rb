# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  # def self.search(search)
  #   if search
  #     student = Student.find_by(name: search)
  #     if student 
  #       self.where(student_id: student)
  #     else
  #       Student.all
  #     end 
  #   else
  #     Student.all
  #   end 
  # end 
  def self.search(search)
    if search.present?
      where('NAME like ?', "%#{search}%")
    else
      self.all
    end
  end
end
