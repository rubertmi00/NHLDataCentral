-- This file is to bootstrap a database for the CS3200 project. 

-- Create a new database.  You can change the name later.  You'll
-- need this name in the FLASK API file(s),  the AppSmith 
-- data source creation.
create database NHL;

-- Via the Docker Compose file, a special user called webapp will 
-- be created in MySQL. We are going to grant that user 
-- all privilages to the new database we just created. 
-- TODO: If you changed the name of the database above, you need 
-- to change it here too.
grant all privileges on NHL.* to 'webapp'@'%';
flush privileges;

-- Move into the database we just created.
-- TODO: If you changed the name of the database above, you need to
-- change it here too. 
use NHL;

-- Put your DDL 
create table Coach (
	Id INT NOT NULL,
	FirstName VARCHAR(6) NOT NULL,
	LastName VARCHAR(10) NOT NULL,
	LifetimeRecord VARCHAR(50) NOT NULL,
	StanleyCups INT NOT NULL,
	JackAdamsAwards INT NOT NULL,
	PRIMARY KEY (Id)
);

create table Team (
	TeamName VARCHAR(10) NOT NULL,
	Location_ VARCHAR(10) NOT NULL,
	Division VARCHAR(12) NOT NULL,
	Owner_ VARCHAR(13) NOT NULL,
	GM VARCHAR(14) NOT NULL,
	Mascot VARCHAR(8),
	StanleyCups INT NOT NULL,
	PresidentsTrophies INT NOT NULL,
	SalaryCapSpace INT,
	StateTaxRate DECIMAL(4,1),
	Coach INT NOT NULL,
	PRIMARY KEY (TeamName),
	FOREIGN KEY (Coach) REFERENCES Coach(Id)
);

create table Player (
	Id INT NOT NULL AUTO_INCREMENT,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Age INT NOT NULL,
	Height INT NOT NULL,
	Weight_ INT NOT NULL,
	Nationality VARCHAR(50) NOT NULL,
	Position VARCHAR(10),
	Salary INT,
	SigningBonuses INT,
	PerformanceBonuses INT,
	TeamName VARCHAR(12) NOT NULL,
	PRIMARY KEY (Id),
	FOREIGN KEY (TeamName) REFERENCES Team(TeamName)
);

create table Arena (
	TeamName VARCHAR(10) NOT NULL,
	ArenaName VARCHAR(21) NOT NULL,
	Capacity INT,
	AvgAttendance INT,
	AvgTicketPrice INT,
	AvgConcessionRevenue INT,
	AvgMerchRevenue INT,
  PRIMARY KEY (ArenaName),
	FOREIGN KEY (TeamName) REFERENCES Team(TeamName)
);

create table StatsBySeason (
  Player INT NOT NULL,
  Season INT NOT NULL,
  Goals INT,
  Assists INT,
  Hits INT,
  ATOI DECIMAL(6,3),
  SavePct DECIMAL(6,3),
  GAA DECIMAL(6,3),
	FOREIGN KEY (Player) REFERENCES Player(Id),
	PRIMARY KEY (Player, Season)
);

create table RecordBySeason (
	Team VARCHAR(10) NOT NULL,
	Season INT NOT NULL,
	Record VARCHAR(50),
	FOREIGN KEY (Team) REFERENCES Team(TeamName),
	PRIMARY KEY (Team, Season)
);

create table Fights (
	Player1 INT NOT NULL,
	Player2 INT NOT NULL,
	Winner INT,
	FOREIGN KEY (Player1) REFERENCES Player(Id),
	FOREIGN KEY (Player2) REFERENCES Player(Id),
	PRIMARY KEY (Player1, Player2)
);

-- Add sample data. 
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (1, 'Lindy', 'Ruff', '545-918-69', 3, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (2, 'Gerard', 'Gallant', '250-195-18', 3, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (3, 'Rod', 'Brindamour', '301-564-22', 2, 1);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (4, 'Mike', 'Sullivan', '30-368-17', 2, 0);

insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Devils', 'New Jersey', 'Metropolitan', 'Josh Harris', 'Tom Fitzgerald', 'NJ Devil', 3, 4, 1850036, 0.0, 1);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Rangers', 'New York', 'Metropolitan', 'James Dolan', 'Chris Drury', 'Sparky', 4, 2, 3305837, 0.2, 2);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Hurricanes', 'Carolina', 'Metropolitan', 'Tom Dundon', 'Don Waddell', 'Hamilton', 1, 1, 2914660, 0.0, 3);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Penguins', 'Pittsburgh', 'Metropolitan', 'Mario Lemieux', 'Ron Hextall', 'Iceburgh', 5, 4, 424864, 0.2, 4);

insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Sebastian', 'Aho', 21, 75, 181, 'Finland', 'center', 4547713, 4135566, 66516, 'Hurricanes');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Vitek', 'Vanecek', 21, 72, 172, 'Czechia', 'goaltender', 2230430, 3483597, 96428, 'Devils');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Adam', 'Fox', 39, 72, 196, 'USA', 'defenseman', 12151132, 9103757, 80656, 'Rangers');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Mackenzie', 'Blackwood', 21, 77, 177, 'Canada', 'goaltender', 5462048, 2527879, 34276, 'Devils');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Kris', 'Letang', 19, 72, 188, 'Canada', 'defenseman', 2505735, 2305441, 22787, 'Penguins');

insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Devils', 'Prudential_Center', 17552, 15729, 228, 4797, 5488);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Rangers', 'Madison_Square_Garden', 17628, 17580, 106, 9663, 7909);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Hurricanes', 'PNC_Arena', 17435, 16289, 161, 6525, 2067);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Penguins', 'PPG_Paints_Arena', 19815, 17014, 54, 4904, 5456);

insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI, SavePct, GAA) values (1, 2021, 40, 60, 133, 21.3, NULL, NULL);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI, SavePct, GAA) values (1, 2020, 20, 32, 97, 19.2, NULL, NULL);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI, SavePct, GAA) values (1, 2019, 33, 13, 104, 18.6, NULL, NULL);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI, SavePct, GAA) values (3, 2021, 14, 50, 203, 24.7, NULL, NULL);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI, SavePct, GAA) values (5, 2021, 0, 19, 186, 23.5, NULL, NULL);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI, SavePct, GAA) values (5, 2020, 4, 24, 332, 22.1, NULL, NULL);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI, SavePct, GAA) values (5, 2019, 6, 7, 244, 24.8, NULL, NULL);

insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI, SavePct, GAA) values (2, 2021, NULL, NULL, NULL, NULL, 0.909, 2.34);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI, SavePct, GAA) values (2, 2020, NULL, NULL, NULL, NULL, 0.915, 2.05);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI, SavePct, GAA) values (2, 2019, NULL, NULL, NULL, NULL, 0.904, 2.24);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI, SavePct, GAA) values (4, 2021, NULL, NULL, NULL, NULL, 0.894, 3.54);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI, SavePct, GAA) values (4, 2020, NULL, NULL, NULL, NULL, 0.901, 3.13);

insert into RecordBySeason (Team, Season, Record) values ('Devils', 2021, '60-20-2');
insert into RecordBySeason (Team, Season, Record) values ('Devils', 2020, '35-35-12');
insert into RecordBySeason (Team, Season, Record) values ('Devils', 2019, '50-25-7');
insert into RecordBySeason (Team, Season, Record) values ('Rangers', 2021, '30-50-2');
insert into RecordBySeason (Team, Season, Record) values ('Rangers', 2020, '43-27-12');
insert into RecordBySeason (Team, Season, Record) values ('Rangers', 2019, '43-37-2');
insert into RecordBySeason (Team, Season, Record) values ('Hurricanes', 2021, '55-19-8');
insert into RecordBySeason (Team, Season, Record) values ('Hurricanes', 2020, '44-28-10');
insert into RecordBySeason (Team, Season, Record) values ('Hurricanes', 2019, '41-29-12');
insert into RecordBySeason (Team, Season, Record) values ('Penguins', 2021, '28-40-14');
insert into RecordBySeason (Team, Season, Record) values ('Penguins', 2020, '33-37-12');
insert into RecordBySeason (Team, Season, Record) values ('Penguins', 2019, '35-36-11');

insert into Fights (Player1, Player2, Winner) values (1, 3, 1);
insert into Fights (Player1, Player2, Winner) values (1, 5, 5);
insert into Fights (Player1, Player2, Winner) values (3, 5, 3);
insert into Fights (Player1, Player2, Winner) values (2, 4, 2);