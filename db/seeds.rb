# db/seeds.rb

# Create a teacher
teacher = Teacher.create(phone_number: "8904370081", otp: "123456")

# Create students associated with the teacher
teacher.students.create(name: "Akshay", subject: "Math", marks: 85)
teacher.students.create(name: "Kumar", subject: "Science", marks: 90)
