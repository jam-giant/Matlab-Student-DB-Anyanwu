classdef Student
    properties
        ID = "" % empty string for student IDs
        name = "" % empty string for student Names
        age = "" % empty string for student ages
        GPA = "" % empty string for student GPAs
        major = "" % empty string for student Majors
    end

    methods
        function show_student_info = showStudent(currentObj)
            fprintf("The student ID  is %s\n", currentObj.ID)
            fprintf("The name of the student is %s\n", currentObj.name)
            fprintf("The age of the student is %s\n", currentObj.age)
            fprintf("the GPA of the student is %s\n", currentObj.GPA)
            fprintf("The major of the student is %s\n", currentObj.major)
            show_student_info = 1;
        end
        % Function that prints the information of the students that are inputted into the current object

        function res = studentInit(currentObj)
            %ask the user for information from i/o
            currentObj.ID = input("Whats the ID of the student?","s");
            currentObj.name = input("Whats the name of the student?","s");
            currentObj.age = input("Whats the age of the student?","s");
            currentObj.GPA = input("Whats the GPA of the student?","s");
            currentObj.major = input("Whats the major of the student?","s");
            res = currentObj;
        end
        % Function that asks the user to input the IDs, names, ages, gpas, and of the students for a number of students set in the main.m script
    end

end