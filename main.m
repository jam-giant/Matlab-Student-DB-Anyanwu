db = StudentDB;
size = 3;
db = db.initDB(size);
% Establishes that the varible db is the class StudentDB
% Establishes that the size of the database is a number, in this case 3 students
% Calls for the initDB function to initialize the database according to the size set here

count = 5;
for i = 1:count
    db = db.createUser();
end
% Calls for a max number of users in the database. If the size varriable exceeds the count-
% -then it will refer to the instruction in the createUser function and say that the database is full 

db.showStudents();
% Calls for the showStudents function in StudentDB.m, just showing the info of the student in the database

file_name = "student_data.mat";
db.save_to_file(file_name);
% Sets the name of the file which can be changed by the user here. 
% Calls for the save_to_file function in StudentDB. Makes the name of the file the name set by the user.

loadedDB = StudentDB();
loadedDB = loadedDB.load_from_file(file_name);
loadedDB.showStudents();
% Loads the student information in the saved .mat file and shows the information.

db.GPA_histogram();
% Calls for the GPA distribution function in StudentDB.m 

db.age_histogram();
% Calls for the age distribution function in StudentDB.m

target_major = "Mechanical Engineering";
db.studentsbymajor(target_major);
% User can set the major that they are lookig for
% Calls for the studentsbymajor funtion in StudentDB.m

target_ID = "3";
db.findStudent(target_ID);
% User can set the ID of the student that they are lookig for
% Calls for the findStudent funtion in StudentDB.m

search_ID = "2";
New_GPA = "3.2";
db.updateGPA(search_ID, New_GPA)
% User can set the ID of the student that they are lookig for
% User can set the new GPA for that student
% Calls for the updateGPA funtion in StudentDB.m