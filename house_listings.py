import MySQLdb
import MySQLdb.cursors as cursors

#this is to connect to the db on the localhost with user 'username', 'password', and database 'db_name'
db = MySQLdb.connect (host="localhost", db="roomdb",read_default_file="~/.my.cnf")
cursor =  db.cursor()


def add_house(name, addr, desc, price):
  print "==========entering add_house========="

  #check if the user exists already
  if cursor.execute("Select (1) from house_listings where addr = '%s'" % (addr)):
    print "\n\n!!!!This house already exists!!!!\n\n"
    


  #if not, add the user to the db
  else:
    #try:
      print "\n========New house listing created, adding to db...=======\n"
       
      #desc is a reserved word for mysql, consider changing
      cursor.execute("INSERT INTO house_listings(name, addr, `desc`, price) VALUES ('%s','%s','%s','%s')" % (name, addr, desc, price))

      db.commit()
      cursor.close()



def display_houses():

  cursor.execute("Select * from house_listings" )
  for (iden, name, addr, desc, price) in cursor:
    print iden, name, addr, desc, price
  print "\n\n"


  #data = cursor.fetchall()        #grabs line that corredponds to last execute, line is an array
  #name = data[0]
  #print "\n\n Welcome,", name, "!\n\n"


display_houses()
