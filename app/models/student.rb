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

  def self.search(search)
    @results = []
    if search
      self.all.each do |student| 
        if student.name.include?(search.titleize)  
          @results << student
        end
      end
    else
      @results = self.all
    end
    @results
  end
end