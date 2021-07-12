-- performance database for crexx
drop table if exists architecture; 
create table architecture
( id   	     integer not null primary key,
  name	     varchar(50) not null,
  details    varchar(255)
);

insert into architecture(id, name, details)
values( 1, 'x86_64', 'Intel X86 64 bit' );
insert into architecture(id, name, details)
values( 2, 'aarch64', 'ARM 64 bit' );
insert into architecture(id, name, details)
values( 3, 'Z', 'IBM z/Arch' );
insert into architecture(id, name, details)
values( 4, 'S/360', 'IBM System 360, 24 bit' );
insert into architecture(id, name, details)
values( 5, 'S/370', 'IBM System 370, 24 bit'  );
insert into architecture(id, name, details)
values( 6, 'S/390', 'IBM System 390, 31 bit' );
insert into architecture(id, name, details)
values( 7, 'Power', 'IBM Power' );
insert into architecture(id, name, details)
values( 8, 'armv6l', 'ARM V6, 32 bit' );

drop table if exists platform;
create table platform
( id   	     integer not null primary key,
  name	     varchar(50) not null,
  cpu        varchar(10) not null,
  brand	     varchar(50) not null,
  osname     varchar(50) not null,
  oslevel     varchar(50) not null,	
  arch	     integer not null,
  bitness    integer not null,
  endian     integer not null, -- 0 is LE, 1 is BE
  clock_speed integer not null,
  details    varchar(255),
  foreign key(arch) references architecture(id) 
);

insert into platform(id, name, cpu, brand, osname, oslevel, arch, bitness, endian, clock_speed, details)
values( 1, 'Raspberry Pi 4 rev 1.4', 'Broadcom BCM2711, Quad core Cortex-A72 (ARM v8)', 'Raspberry', 'Ubuntu 20.04.2 LTS', '20.04', 1, 64, 0, 1500000000, '8GB memory' );

drop table if exists benchmark;
create table benchmark
( id   	     integer not null primary key,
  name	     varchar(50) not null,
  path       varchar(500) not null,
  details    varchar(255)
);

drop table if exists implementation;
create table implementation
( id   	     integer not null primary key,
  name	     varchar(50) not null,
  version    varchar(50) not null,
  details    varchar(255)
);

insert into implementation(id, name, version, details)
values(1, 'cRexx', 'pre-release', 'rexx level b');
insert into implementation(id, name, version, details)
values(2, 'cRexx-rxasm', 'pre-release', 'rexx assembler');
insert into implementation(id, name, version, details)
values(3, 'cRexx', 'pre-release', 'rexx level c');
insert into implementation(id, name, version, details)
values(4, 'Regina', '', '');
insert into implementation(id, name, version, details)
values(5, 'ooRexx', '5.00B', '');

drop table if exists performance;
create table performance
( id   	     integer not null primary key,
  time	     datetime not null,
  platform   integer not null,
  impl	     intereger not null,
  benchmark  integer not null,
  foreign key(impl) references implementation(id),
  foreign key(platform) references platform(id)
);


