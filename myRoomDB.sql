DROP TABLE IF EXISTS `PROFILE_DTLS`;

CREATE TABLE `PROFILE_DTLS` (
`userid` varchar(50) DEFAULT NULL,
`drink` varchar(2) DEFAULT NULL,
`party` varchar(2) DEFAULT NULL,
`smoke` varchar(2) DEFAULT NULL,
`clean` varchar(2) DEFAULT NULL,
`pets` varchar(2) DEFAULT NULL,
KEY `UID` (`userid`),
CONSTRAINT `UID` FOREIGN KEY (`userid`) REFERENCES `USER_DTLS` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



LOCK TABLES `PROFILE_DTLS` WRITE;

UNLOCK TABLES;

DROP TABLE IF EXISTS `USER_DTLS`;   

CREATE TABLE `USER_DTLS`    (
`userid` varchar(50) NOT NULL,    
`name` varchar(100) DEFAULT NULL,
`gender` varchar(2) DEFAULT NULL,
`age` int(11) DEFAULT NULL,
`email` varchar(100) DEFAULT NULL,
`password` varchar(100) DEFAULT NULL,
PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


LOCK TABLES `USER_DTLS` WRITE;

UNLOCK TABLES;

