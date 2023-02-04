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

new_student_id = students.insert_one(
    {'student_id': 1010, 'first_name': 'John', 'last_name': 'Doe'})

print("-- INSERT STATEMENTS --")
print('Inserted student record into the students collection with document_id %s' %
      (new_student_id.inserted_id))
print()

doc = students.find_one({"student_id": 1010})
print("-- DISPLAYING STUDENT TEST DOC --")

print('Student ID: %s' % doc["student_id"])
print('First Name: %s' % doc["first_name"])
print('Last Name: %s' % doc["last_name"])
print()

students.delete_one({"student_id": 1010})

docs = students.find({})
print("-- DISPLAYING STUDENTS DOCUMENTS FROM find() QUERY --")
for doc in docs:
    print('Student ID: %s' % doc["student_id"])
    print('First Name: %s' % doc["first_name"])
    print('Last Name: %s' % doc["last_name"])
    print()
