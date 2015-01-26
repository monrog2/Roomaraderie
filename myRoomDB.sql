DROP TABLE IF EXISTS 'users';   

CREATE TABLE 'users'    (
'id' int AUTO_INCREMENT NOT NULL,    
'name' varchar(100) DEFAULT NULL,
'gender' varchar(2) DEFAULT NULL,
'age' int(11) DEFAULT NULL,
'email' varchar(100) DEFAULT NULL,
'password' varchar(100) DEFAULT NULL,
PRIMARY KEY ('id')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES 'users' WRITE;

UNLOCK TABLES;



DROP TABLE IF EXISTS 'prof_questions';   

CREATE TABLE 'prof_questions'    (
'id' int AUTO_INCREMENT NOT NULL,    
'question' varchar(100) DEFAULT NULL,
'type' varchar(10) DEFAULT NULL,
'posans1' varchar(100) DEFAULT NULL,
'posans2' varchar(100) DEFAULT NULL,
'posans3' varchar(100) DEFAULT NULL,
PRIMARY KEY ('id')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES 'prof_questions' WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS 'pref_questions';   

CREATE TABLE 'pref_questions'    (
'id' int AUTO_INCREMENT NOT NULL,    
'question' varchar(100) DEFAULT NULL,
'type' varchar(10) DEFAULT NULL,
'posans1' varchar(100) DEFAULT NULL,
'posans2' varchar(100) DEFAULT NULL,
'posans3' varchar(100) DEFAULT NULL,
PRIMARY KEY ('id')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES 'pref_questions' WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS 'house_listings';   

CREATE TABLE 'house_listings'    (
'id' int AUTO_INCREMENT NOT NULL,    
'name' varchar(100) DEFAULT NULL,
'addr' varchar(100) DEFAULT NULL,
'desc' varchar(100) DEFAULT NULL,
'price' varchar(100) DEFAULT NULL,
PRIMARY KEY ('id')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES 'house_listings' WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS 'user_preferences';   

CREATE TABLE 'user_preferences'    (
'user_id' int NOT NULL,    
'pref_id' int NOT NULL,
'weight' int DEFAULT NULL,
'answer' varchar(100) DEFAULT NULL,
PRIMARY KEY ('user_id', 'pref_id'),
FOREIGN KEY ('user_id') REFERENCES 'users' ('id'),
FOREIGN KEY ('pref_id') REFERENCES 'pref_questions' ('id')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES 'user_preferences' WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS 'user_profiles';   

CREATE TABLE 'user_profiles'    (
'user_id' int NOT NULL,    
'prof_id' int NOT NULL,
'weight' int DEFAULT NULL,
'answer' varchar(100) DEFAULT NULL,
PRIMARY KEY ('user_id', 'pref_id'),
FOREIGN KEY ('user_id') REFERENCES 'users' ('id'),
FOREIGN KEY ('prof_id') REFERENCES 'prof_questions' ('id')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES 'user_profiles' WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS 'user_houses';   

CREATE TABLE 'user_houses'    (
'user_id' int NOT NULL,    
'house_id' int NOT NULL,
PRIMARY KEY ('user_id', 'house_id'),
FOREIGN KEY ('user_id') REFERENCES 'users' ('id'),
FOREIGN KEY ('house_id') REFERENCES 'house_listings' ('id')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES 'user_houses' WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS 'user_favs';   

CREATE TABLE 'user_favs'    (
'user_id' int NOT NULL,    
'house_id' int NOT NULL,
PRIMARY KEY ('user_id', 'house_id'),
FOREIGN KEY ('user_id') REFERENCES 'users' ('id'),
FOREIGN KEY ('house_id') REFERENCES 'house_listings' ('id')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES 'user_favs' WRITE;

UNLOCK TABLES;



DROP TABLE IF EXISTS 'profiles';

CREATE TABLE 'profiles' (
'user_id' int NOT NULL,
'prof_id' int NOT NULL,
'weight' int(2) DEFAULT NULL,
'answer' varchar(50) DEFAULT NULL,
KEY 'UID' ('user_id'),
CONSTRAINT 'UID' FOREIGN KEY ('user_id') REFERENCES 'users' ('id'),
FOREIGN KEY ('prof_id') REFERENCES 'prof_questions' ('id')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



LOCK TABLES 'profiles' WRITE;

UNLOCK TABLES;


