from pymongo import MongoClient
url = "mongodb+srv://admin:admin@cluster0.nx2rkjl.mongodb.net/pytech"
client = MongoClient(url)
db = client.pytech

students = db.students
docs = students.find({})
print("-- DISPLAYING STUDENTS DOCUMENTS FROM find() QUERY --")
for doc in docs:
    print('Student ID: %s' % doc["student_id"])
    print('First Name: %s' % doc["first_name"])
    print('Last Name: %s' % doc["last_name"])
    print()

doc = students.find_one({"student_id": 1008})
print("-- DISPLAYING STUDENT DOCUMENT FROM find_one() QUERY --")

print('Student ID: %s' % doc["student_id"])
print('First Name: %s' % doc["first_name"])
print('Last Name: %s' % doc["last_name"])
print()
