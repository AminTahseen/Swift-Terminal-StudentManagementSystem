class Person{
    var name:String=""
    var age:Int=0
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
}

class Student: Person{
    var studentId:String=""
    var grades:[Int]=[]
    
    // computed properties
    var totalOfGrades:Int{
        let sum=grades.reduce(0, +)
        return sum
    }
    init(name:String, age:Int,studentId: String, grades: [Int]) {
        self.studentId = studentId
        self.grades = grades
        super.init(name: name, age:age)
    }
    func calculatAverage()->Double{
        let sum=grades.reduce(0, +)
        return Double(sum)/Double(grades.count)
    }
    func displayInfo()->String{
        return "{studentId:\(studentId), name:\(super.name), age:\(super.age), grades:\(grades), totalOfGrades:\(totalOfGrades)}\n";
    }
}
