# BikeToday
Vale a pena andar de bike hoje?


MYSQL commands:

```mysql
CREATE DATABASE bike;
```

```mysql
USE bike;
```

```mysql
CREATE TABLE users (
ID INT(11) not null auto_increment,
EMAIL varchar(64) not null,
IMAGE mediumblob,
password varchar(32) not null,
USERNAME VARCHAR(16) not null,
home_address varchar(64),
work_address varchar(64),
PRIMARY KEY (ID),
UNIQUE (EMAIL),
UNIQUE (USERNAME)
);
```

