	class University 

	end

	class Faculty < University

	end

	class Group < Faculty

	def initialize(name)
		@name = name
	end

	def add_student
	end

	end

	class Student < Group
	attr_accessor :name, :l_name, :group, :supahash, :subject
	def initialize(f_name, l_name, group)
		@f_name = f_name
		@l_name = l_name
		@group = group
		@supahash = Hash.new
	end

	def show
		return @f_name, @l_name, @group
	end

	def marks(subject, mark)
	@supahash[subject] = mark
	
	end

	def show_marks
		return @supahash
	end

	def avg_marks
		return @supahash.inject { |sum,v| (sum+ v) / @supahash.size	 }
	end
end

	class Subject < Student
	def initialize(name)
	@name = name
	end

	def get_subj
		return @name
	end

	end

	a = Student.new('Valentin','Lee', 1)
	p a.show

	s = Subject.new('Math')
	s1 = Subject.new('OS')

	a.marks(s.get_subj, 10)
	a.marks(s1.get_subj, 10)
	p a.subject
	p a.show_marks
	p a.avg_marks

p a.avg_marks