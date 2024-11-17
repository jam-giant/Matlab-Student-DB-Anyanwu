%Student Data Base Script
classdef StudentDB
    properties
        size = 10
        studentList = [Student]
        number_of_users = 0
    end
    % Sets the propertis of the class. 
    % The size of the database is 10 users
    % the student list is the information that was inputted from the Student class
    % The initial number of users in the datatbase is 0

    methods
        function res = initDB(currentObj, size)
            % intitialize the array of objects and allocate the memory
            currentObj.size = size;
            currentObj.studentList(1:currentObj.size) = Student;
            res = currentObj;
        end

        function res = createUser(currentObj, size)
            %checks if the space in the database is not full
            if currentObj.number_of_users < currentObj.size
                student = Student;
                currentObj.studentList(currentObj.number_of_users + 1) = student.studentInit();
                currentObj.number_of_users = currentObj.number_of_users + 1;
                res = currentObj;
                % implents the function used to get another students info until the database spaces are full
            else
                fprintf("The database is full\n")
                res = currentObj;
                % Makes it so that if the current number of users in the database is greater than the size of the database, it will print the message that the database is full
            end
        end

        function res = showStudents(currentObj)
            for i = 1:currentObj.number_of_users
                currentObj.studentList(i).showStudent()
            end
            res = 1;
        end
        % Shows the information of the students in Student that was stored in the database. Shows for the number of students in the List.

        function save_to_file(currentObj, file_name)
            if nargin < 2
                file_name = 'student_data.mat';
                % If there is no argument set for the file name, then the file name will be student_data.mat
            end
            save(file_name,"currentObj");
        end
        % Saves the student information stored in the student database to a .mat file

        function currentObj = load_from_file(currentObj, file_name)
            if nargin < 2
                file_name = 'student_data.mat';
                % If there is no argument set for the file name, then the file name will be student_data.mat
            end
            loadedData = load(file_name);
            currentObj = loadedData.currentObj;
            fprintf("The student data has been loaded from %s\n", file_name);
        end
        % Loads the student data that is stored in the current object(the database)

        function GPA_histogram(currentObj)
            gpas = [];
            % Puts the numeric values for GPA(found in the next part) into an array
            for i = 1:currentObj.number_of_users
                gpa_str = currentObj.studentList(i).GPA;
                gpa = str2double(gpa_str);
                gpas = [gpas,gpa];
            end
            % Converts the values for GPA in the database from string values to numeric values so that-
            % -they can be put into a numeric array

            figure;
            % Creates a new figure for the graph
            histogram(gpas, 10);
            xlabel("GPA");
            ylabel("Frequency");
            title("GPA Distribution Histogram");
            grid on;
            % Creates a histogram using the GPA values and an already existing matlab histogram graph function
        end

         function age_histogram(currentObj)
            ages = [];
            % Puts the numeric values for age(found in the next part) into an array
            for i = 1:currentObj.number_of_users
                age_str = currentObj.studentList(i).age;
                age = str2double(age_str);
                ages = [ages, age];
                % Converts the values for age in the database from string values to numeric values so that-
                % -they can be put into a numeric array
            end

            figure; 
            % Creates a new figure for the age histogram
            histogram(ages, 10);
            xlabel("Age");
            ylabel("Frequency");
            title("Age Distribution Histogram");
            grid on;
            % Creates a histogram using the age values and an already existing matlab histogram graph function
         end

        function res = updateGPA(currentObj, ID, new_GPA)
            res = 0;
            q = input("Would you like to change the GPA of any student? Answer yes or no.\n", "s");
            if q == "yes"
                % Asks the user if they want to update any GPAs. If the answer is yes then it carries on to-
                for i = 1:currentObj.number_of_users
                    if strcmp(currentObj.studentList(i).ID, ID)
                        currentObj.studentList(i).GPA = new_GPA;
                        fprintf("Student %s GPA has been changed to %s.\n", currentObj.studentList(i).ID, new_GPA);
                        res = 1;
                        break;
                    end
                end
                % -search for the student with the ID specified in main.m and updates the GPA in the database to the new GPA value
                % If the ID is found then the res equals true
                if res == 0
                        fprintf("!!!!!!!!Student ID not found!!!!!!!!");
                end
                % If the ID is not found, then res iis false and this error message is printed
           end
        end

        function res = studentsbymajor(currentObj, major)
            res = 0;
            q = input("Would you like to see a list of students for a specific major? Answer yes or no.\n","s");
            if q == "yes"
                % Asks the user if they want to search for students of a major. If the answer is yes then it carries on to-
                for i = 1:currentObj.number_of_users
                    if strcmp(currentObj.studentList(i).major, major)
                        currentObj.studentList(i).showStudent();
                        res = 1;
                    end
                end
                % -go through the list of students in the database and find the ones with the major specified in the-
                % -main.m script.
                % -It then shows the information of those students if the major is found and the result is true
                if res == 0
                    fprintf("!!!!!!!!Major Not Found!!!!!!!!")
                end
                % If the major is not found then the result is false and it prints this error message
            end
        end



        function res = findStudent(currentObj, ID)
            res = 0;
            q = input("Would you like to find a student by their ID? Answer yes or no.\n","s");
            if q == "yes"
                % Asks the user if they want to find a student with a specific ID.
                % If the answer is yes then it carries on to-
                for i = 1:currentObj.number_of_users
                    if strcmp(currentObj.studentList(i).ID, ID)
                        currentObj.studentList(i).showStudent();
                        res = 1;
                        break;
                    end
                end
                % -Go through the student list in the database to find the student with the ID specified in main.m.
                % If the ID is found, it prints the information of that student and the result is true
                if res == 0
                    fprintf("!!!!!!!!Student Not Found!!!!!!!!");
                end
                % If the ID is not found then the result is false and this error message is printed.
            end

        end
    end
end