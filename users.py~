import MySQLdb

#this is to connect to the db on the localhost with user 'username', 'password', and database 'db_name'
db = MySQLdb.connect ("localhost", "roomaraderie", "Capstone132", "roomdb")
cursor =  db.cursor()


def add_user(name, gender, age, email,password):
  print "==========entering add_user========="

  #check if the user exists already
  if cursor.execute("Select (1) from users where email = '%s'" % (email)):
    print "\n\n!!!!This user already exists!!!!\n\n"

  #if not, add the user to the db
  else:
    #try:
      print "\n========New user created, adding to db...=======\n"
      cursor.execute("INSERT INTO users(name, gender, age, email, password) VALUES ('%s','%s','%s','%s','%s')" % (name, gender, age, email, password))
      db.commit()
    



def login(email, password):
  
  if cursor.execute("Select (1) from users where email = '%s' and password = '%s'" % (email, password)):
    cursor.execute("Select name from users where email = '%s' and password = '%s'" % (email, password))
    data = cursor.fetchone()        #grabs line that corredponds to last execute, line is an array
    name = data[0]   
    print "\n\n Welcome,", name, "!\n\n"

  else:
    print "username and/or pasword does not exist"
