-- performance database for crexx

drop table if exists architecture; 
create table architecture
( id   	     integer not null primary key,
  name	     varchar(50) not null,
  details    varchar(255)
);
  
drop table if exists platform;
create table platform
( id   	     integer not null primary key,
  name	     varchar(50) not null,
  osname     varchar(50) not null,
  oslevel     varchar(50) not null,	
  arch	     integer not null,
  bitness    integer not null,
  endian     integer not null,
  details    varchar(255),
  foreign key(arch) references architecture(id) 
);

drop table if exists benchmark;
create table benchmark
( id   	     integer not null primary key,
  name	     varchar(50) not null,
  path       varchar(500) not null
  details    varchar(255)  
);

drop table if exists performance;
create table performance
( id   	     integer not null primary key,
  time	     datetime not null,
  platform   integer not null,
  benchmark  integer not null,
  foreign key(platform) references platform(id)
);


