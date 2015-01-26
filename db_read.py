import MySQLdb

#this is to connect to the db on the localhost with user 'username', 'password', and database 'db_name'
db = MySQLdb.connect ("localhost", "roomaraderie", "Capstone132", "roomdb")
cursor =  db.cursor()

#Ideally this value will be grabbed from some online webform
user_input = raw_input('What is your username?\n')

def db_test(user):
  print "==========testing writing to db========="

  #check if the user exists already
  if cursor.execute("Select (1) from users where name = '%s'" % (user)):
    print "This user already exists."

  #if not, add the user to the db
  else:
    #try:
      print "========New user created, adding to db...======="
      cursor.execute("INSERT INTO users(name) VALUES ('%s')" % (user))
      db.commit()
    
db_test(user_input)
