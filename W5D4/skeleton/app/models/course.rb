class Course < ApplicationRecord
    has_many :enrollments,
      primary_key: :id,
      foreign_key: :course_id,
      class_name: :Enrollment
    has_many :enrolled_students,
      through: :enrollments,
      source: :user

    belongs_to :instructor,
      primary_key: :id,
      foreign_key: :instructor_id,
      class_name: :User
      
    #null : false
    belongs_to :prereq,
      primary_key: :id,
      foreign_key: :prereq_id,
      class_name: :Course,
      optional: :true


    has_many :parent_classes,
      primary_key: :id,
      foreign_key: :prereq_id,
      class_name: :Course
      # null :false
end
#101 has parent classes, 101 , 102 ,103 
#world history
# history of russia
#history of india