from pymongo import MongoClient
url = "mongodb+srv://admin:admin@cluster0.nx2rkjl.mongodb.net/pytech";
client = MongoClient(url)
db = client.pytech
#the instructions did not have the () but it is the only way I could get it to work
print(db.list_collection_names())
