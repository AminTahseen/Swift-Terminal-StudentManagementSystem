class StudentManagementSystem{
    var students:[Student]=[] // array of object
    
    func getStudentById(studentId:String)->Student?{
        let student=students.first(where: {$0.studentId==studentId})
        return student
    }
    
    func addStudent(){
        print("Enter name:")
        let name = readLine() ?? ""
        
        print("Enter age:")
        let age = Int(readLine() ?? "") ?? 0
        
        print("Enter student Id:")
        let studentId=readLine() ?? ""
        
        print("Enter grades (comma separated):")
        let grades = (readLine() ?? "").split(separator: ",").compactMap {Int($0.trimmingCharacters(in:.whitespaces))}
        
        let student=Student(name: name, age:age, studentId: studentId, grades: grades)
        students.append(student)
        print("-Student added successfully-")
    }
    
    func listAllStudent(){
        print("-All Students-")
        for student in students {
            print(student.displayInfo())
        }
    }
    
    func findStudentById(){
        print("Enter student Id : ")
        let studentId=readLine() ?? ""
        print(getStudentById(studentId: studentId)?.displayInfo() ?? "-No Student Found-")
    }
    
    func removeStudentById(){
        print("Enter student Id : ")
        let studentId=readLine() ?? ""
        let index:Int=students.firstIndex(where: {$0.studentId == studentId}) ?? -1
        if(index == -1){
            print("-No Student Found-")
        }else{
            students.remove(at: index)
            print("-Student removed successfully-")
            
        }
    }
    
    func getAverageGrade(){
        print("Enter student Id : ")
        let studentId=readLine() ?? ""
        let student:Student?=getStudentById(studentId: studentId)
        if student == nil{
            print("-No Student Found-")
        }else{
            let average=student?.calculatAverage() ?? 0.0
            print(student?.displayInfo() ?? "")
            print("Average Grade : \(average)")
        }
    }
    
    func showMenu(){
        while true {
            print("\nStudent Management System:")
            print("\n--------------------------\n")
            print("1. Add Student")
            print("2. Remove Student")
            print("3. Display All Students")
            print("4. Find Student by ID")
            print("5. Display Student Average Grade")
            print("6. Exit")
            print("\n--------------------------\n")
            print("Enter your choice: ", terminator: "")
            
            if let choice = readLine(), let option = Int(choice) {
                switch option {
                case 1:
                    addStudent()
                case 2:
                    removeStudentById()
                case 3:
                    listAllStudent()
                case 4:
                    findStudentById()
                case 5:
                    getAverageGrade()
                case 6:
                    print("Exited...")
                    return
                default:
                    print("Invalid choice. Please try again.")
                }
            } else {
                print("Invalid input. Please enter a number.")
            }
            
            print("\n--------------------------\n")
        }
    }
}
