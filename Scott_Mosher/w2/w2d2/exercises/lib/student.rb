class Student
  attr_reader :courses, :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    first_name + " " + last_name
  end

  def enroll(course)
    if has_conflict?(course)
        raise "course would cause conflict!" 
    end
    
    if !courses.include?(course)
        self.courses << course
        course.students << self
    end
  end

  def course_load
    load = Hash.new(0)
    self.courses.each do |course|
      load[course.department] += course.credits
    end
    load
  end

  def has_conflict?(new_course)
    self.courses.any? do |enrolled_course|
      new_course.conflicts_with?(enrolled_course)
    end
  end
end