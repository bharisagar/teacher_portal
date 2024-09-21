# README

Setup Instructions:
1. Clone the Repository
git clone <repository-url>
cd <repository-directory>

2. Install Elastic Search (mandatory)

3. Start elasticsearch

2. rake db:setup

3. bundle exec rails assets:precompile

4. rails s
-----------------------------------------------------------

Initial Database Setup
1. To set up the initial data for the Teacher Portal, you can use the Rails console. 

Follow these steps to add a teacher and a sample student record:

Open Rails Console
1. rails console
2. Create a Teacher Run the following command to create a teacher with a phone number and an OTP:

teachers = Teacher.create(phone_number: "9538382622", otp: "123456")

3. teachers.save

4. Add a Student After creating the teacher, you can add a student associated with that teacher:

teachers.students.create(name: "Sagar", subject: "Science", marks: 85)

This will create a teacher and a student record in the database, allowing you to test the functionality of the application.
---------------------------------------------------------------------

Technologies Used
Ruby on Rails: 7.2.1
Ruby: 3.3.5
PostgreSQL: For database management
Node.js: v18.3.0
HTML & CSS: Basic styling for views
JavaScript: Vanilla JavaScript for front-end logic
Elasticsearch

In the Teacher Portal, we utilize phone numbers and One-Time Passwords (OTPs) for authentication instead of traditional email and password combinations for several reasons:

Enhanced Security: OTPs provide an additional layer of security. Even if a phone number is compromised, the OTP is valid for a limited time and is unique to each session, reducing the risk of unauthorized access.

Reduced Credential Fatigue: Users often struggle to remember multiple passwords for various services. Using a phone number simplifies the login process by eliminating the need for password management.

Instant Verification: Phone-based authentication allows for quick verification. Users receive an OTP via SMS almost instantly, making the login process faster and more convenient.

Accessibility: In many regions, users may have easier access to mobile phones than email accounts.
