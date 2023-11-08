class Bootcamp
  attr_reader :name, :slogan, :teachers, :students

  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity

    @teachers = []
    @students = []
    @grades = Hash.new { |hash, key| hash[key] = [] }
  end

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    if @students.length < @student_capacity
      @students << student
      true
    else
      false
    end
  end

  def enrolled?(student)
    @students.include?(student)
  end

  def student_to_teacher_ratio
    (@students.length / @teachers.length).floor
  end

  def add_grade(student, grade)
    if enrolled?(student)
      @grades[student] << grade
      true
    else
      false
    end
  end

  def num_grades(student)
    @grades[student].length
  end

  def average_grade(student)
    if enrolled?(student) && num_grades(student) > 0
      @grades[student].sum / num_grades(student)
    else
      nil
    end
  end
end
