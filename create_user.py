import MySQLdb

#this is to connect to the db on the localhost with user 'username', 'password', and database 'db_name'
db = MySQLdb.connect ("localhost", "roomaraderie", "Capstone132", "roomdb")
cursor =  db.cursor()


def add_user(user):
  print "==========testing writing to db========="

  #check if the user exists already
  if cursor.execute("Select (1) from users where name = '%s'" % (user)):
    print "\n\n!!!!This user already exists!!!!\n\n"

  #if not, add the user to the db
  else:
    #try:
      print "\n========New user created, adding to db...=======\n"
      cursor.execute("INSERT INTO users(name) VALUES ('%s')" % (user))
      db.commit()
    
#add_user(user_input)
