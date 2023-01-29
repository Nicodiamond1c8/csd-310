from pymongo import MongoClient
url = "mongodb+srv://admin:admin@cluster0.nx2rkjl.mongodb.net/pytech"
client = MongoClient(url)
db = client.pytech

students = db.students

new_student_1 = {
    "student_id": 1007,
    "first_name": "Nico",
    "last_name": "Diamond"
}
new_student_2 = {
    "student_id": 1008,
    "first_name": "Bob",
    "last_name": "Builder"
}
new_student_3 = {
    "student_id": 1009,
    "first_name": "Barrack",
    "last_name": "Obama"
}

print("-- INSERT STATEMENTS --")
new_student_id = students.insert_one(new_student_1).inserted_id
print('Inserted student record %s %s into the students collection with document_id %s' %
      (new_student_1["first_name"], new_student_1["last_name"], new_student_id))
new_student_id = students.insert_one(new_student_2).inserted_id
print('Inserted student record %s %s into the students collection with document_id %s' %
      (new_student_2["first_name"], new_student_2["last_name"], new_student_id))
new_student_id = students.insert_one(new_student_3).inserted_id
print('Inserted student record %s %s into the students collection with document_id %s' %
      (new_student_3["first_name"], new_student_3["last_name"], new_student_id))
