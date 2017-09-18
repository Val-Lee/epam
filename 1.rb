class University

end

class Faculty < University

end

class Group < Faculty
attr_accessor :supahash
  def initialize(name)
    @name = name
    @supahash = Hash.new(@name)
  end

  def add_student(student)
  	@supahash[@name] = [student]
  end

  def show_group
  	return	@supahash
  end
end

class Student < Group
  attr_accessor :name, :l_name, :supahash, :subject
  def initialize(f_name, l_name)
    @f_name = f_name
    @l_name = l_name
    @supahash = Hash.new
  end

  def show
    return @f_name, @l_name
  end

  def marks(subject, mark)
    @supahash[subject] = mark.to_f
  end

  def show_marks
    return @supahash
  end

  def avg_marks
    return @supahash.values.inject { |sum,v| sum+ v }/ @supahash.size
  end

  # def avg_mark_by_subj(subject)
  # 	return @
  # end
end
g = Group.new("1")

a = Student.new('Valentin','Lee')
p a.show

b = Student.new('Zhora','Rzhavii')
p b.show

g.add_student(a)
g.add_student(b)
p g.show_group
a.marks('Math', 5)
a.marks('OS', 3)		
b.marks('Math', 10)
b.marks('OS', 5)
a.marks('Android', 8)
# p a.subject
p a.show_marks
p a.avg_marks

 p b.show_marks
p b.avg_marks
