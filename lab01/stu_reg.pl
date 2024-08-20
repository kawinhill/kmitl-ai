% student(Student, Year_of_study, Study_Program): Student of Year_of_study in Study_Program.
% course(Course, Year_of_study, Program): Course of Year_of_study in Study_Program.
% complete(Student, Course): Student has completed Course.
% requires(CourseA, CourseB): CourseB is a prerequisite of CourseA.

% example data
student(john, 1, cs).
student(jane, 1, cs).
student(jack, 3, cs).
student(jill, 1, cs).
student(james, 2, se).
student(jenny, 3, se).
course(math101, 1, cs).
course(math102, 1, cs).
course(math103, 1, cs).
course(mathNO, 9, se).

% complete(john, math101).
complete(jane, math101).
requires(math102, math101).

can_enroll(Student, Course) :-
	student(Student, Year_of_study, Study_Program), 
	course(Course, Year_of_study, Study_Program), 
	not(
		complete(Student, Course)), 
	not(
		requires(Course, Prerequisite));
	complete(Student, Prerequisite).

classmate(StudentA, StudentB) :-
	student(StudentA, Year_of_study, Study_Program), 
	student(StudentB, Year_of_study, Study_Program), StudentA \= StudentB.

% can_enroll(john, math102).   % false
% can_enroll(jane, math102).   % true
% can_enroll(jack, math103).   % false
% can_enroll(john, math103).   % true
% classmate(john, jane).       % true
% classmate(john, jack).       % false