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
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	LifetimeRecord VARCHAR(50) NOT NULL,
	StanleyCups INT NOT NULL,
	JackAdamsAwards INT NOT NULL,
	PRIMARY KEY (Id)
);

create table Team (
	TeamName VARCHAR(50) NOT NULL,
	Location_ VARCHAR(50) NOT NULL,
	Division VARCHAR(50) NOT NULL,
	Owner_ VARCHAR(50) NOT NULL,
	GM VARCHAR(50) NOT NULL,
	Mascot VARCHAR(50),
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
	Position VARCHAR(50),
	Salary INT,
	SigningBonuses INT,
	PerformanceBonuses INT,
	TeamName VARCHAR(50) NOT NULL,
	PRIMARY KEY (Id),
	FOREIGN KEY (TeamName) REFERENCES Team(TeamName)
);

create table Arena (
	TeamName VARCHAR(50) NOT NULL,
	ArenaName VARCHAR(50) NOT NULL,
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
	Team VARCHAR(50) NOT NULL,
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
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (1, 'Lindy', 'Ruff', '545-918-69', 0, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (2, 'Gerard', 'Gallant', '250-195-18', 0, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (3, 'Rod', 'Brindamour', '301-564-22', 0, 1);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (4, 'Mike', 'Sullivan', '30-368-17', 2, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (5, 'John', 'Tortarella', '545-918-69', 1, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (6, 'Peter', 'Laviolette', '250-195-18', 0, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (7, 'Brad', 'Larsen', '301-564-22', 0, 1);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (8, 'Lane', 'Lambert', '30-368-17', 0, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (9, 'Jim', 'Montgomery', '545-918-69', 0, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (10, 'Don', 'Granato', '250-195-18', 0, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (11, 'Derek', 'Lalonde', '301-564-22', 0, 1);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (12, 'Marty', 'St Louis', '30-368-17', 0, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (13, 'Sheldon', 'Keefe', '545-918-69', 0, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (14, 'DJ', 'Smith', '250-195-18', 0, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (15, 'Jon', 'Cooper', '301-564-22', 2, 1);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (16, 'Paul', 'Maurice', '30-368-17', 0, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (17, 'John', 'Hynes', '545-918-69', 0, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (18, 'Luke', 'Richardson', '250-195-18', 0, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (19, 'Pete', 'DeBoer', '301-564-22', 0, 1);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (20, 'Craig', 'Berube', '30-368-17', 1, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (21, 'Rick', 'Bowness', '545-918-69', 0, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (22, 'Andre', 'Tourigney', '250-195-18', 0, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (23, 'Jared', 'Bednar', '301-564-22', 1, 1);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (24, 'Dean', 'Evason', '30-368-17', 0, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (25, 'Dallas', 'Eakins', '545-918-69', 0, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (26, 'Todd', 'McLellan', '250-195-18', 0, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (27, 'David', 'Quinn', '301-564-22', 0, 1);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (28, 'Bruce', 'Boudreau', '30-368-17', 0, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (29, 'Jay', 'Woodcroft', '545-918-69', 0, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (30, 'Darryl', 'Sutter', '250-195-18', 1, 0);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (31, 'Bruce', 'Cassidy', '301-564-22', 0, 1);
insert into Coach (Id, FirstName, LastName, LifetimeRecord, StanleyCups, JackAdamsAwards) values (32, 'Dave', 'Hakstol', '30-368-17', 0, 0);

insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Devils', 'New Jersey', 'Metropolitan', 'Josh Harris', 'Tom Fitzgerald', 'NJ Devil', 3, 4, 1850036, 0.0, 1);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Rangers', 'New York', 'Metropolitan', 'James Dolan', 'Chris Drury', 'Ryan Reaves', 4, 2, 3305837, 0.2, 2);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Hurricanes', 'Carolina', 'Metropolitan', 'Tom Dundon', 'Don Waddell', 'Hamilton', 1, 1, 2914660, 0.0, 3);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Penguins', 'Pittsburgh', 'Metropolitan', 'Mario Lemieux', 'Ron Hextall', 'Iceburgh', 5, 4, 424864, 0.2, 4);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Flyers', 'Philadelphia', 'Metropolitan', 'Brian Roberts', 'Chuck Fletcher', 'Gritty', 2, 4, 1850036, 0.0, 5);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Capitals', 'Washington', 'Metropolitan', 'Ted Leonisis', 'Brian MacLellan', 'Sparky', 1, 2, 3305837, 0.2, 6);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('BlueJackets', 'Columbus', 'Metropolitan', 'John McConnell', 'Jarmo Kekalainen', 'Stinger', 0, 1, 2914660, 0.0, 7);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Islanders', 'New York', 'Metropolitan', 'Jon Ledecky', 'Lou Lamoriello', 'Sparky', 4, 4, 424864, 0.2, 8);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Bruins', 'Boston', 'Atlantic', 'Jeremy Jacobs', 'Don Sweeny', 'Blades', 6, 4, 1850036, 0.0, 9);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Sabres', 'Buffalo', 'Atlantic', 'Terry Pegula', 'Kevyn Adams', 'Sabretooth', 0, 2, 3305837, 0.2, 10);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Redwings', 'Detroit', 'Atlantic', 'Chris Illitch', 'Steve Yzerman', 'Al', 9, 1, 2914660, 0.0, 11);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Canadiens', 'Montreal', 'Atlantic', 'Jeff Molson', 'Kent Hughes', 'Youppi!', 24, 4, 424864, 0.2, 12);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('MapleLeafs', 'Toronto', 'Atlantic', 'Larry Tanenbaum', 'Kyle Dubas', 'Carlton', 11, 4, 1850036, 0.0, 13);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Senators', 'Ottawa', 'Atlantic', 'Ryan Reynolds', 'Pierre Dorion', 'Spartacat', 0, 2, 3305837, 0.2, 14);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Lightning', 'Tampa Bay', 'Atlantic', 'Jeff Vinik', 'Julien BriseBois', 'Thunderbug', 3, 1, 2914660, 0.0, 15);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Panthers', 'Florida', 'Atlantic', 'Vincent Viola', 'Bill Zito', 'Stanley C. Panther', 0, 4, 424864, 0.2, 16);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Predators', 'Nashville', 'Central', 'Herb Fritch', 'David Poile', 'Gnash', 0, 4, 1850036, 0.0, 17);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('BlackHawks', 'Chicago', 'Central', 'Rocky Wirtz', 'Kyle Davidson', 'Tommy Hawk', 6, 2, 3305837, 0.2, 18);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Stars', 'Dallas', 'Central', 'Tom Gaglardi', 'Jim Nill', 'Victor E. Green', 1, 1, 2914660, 0.0, 19);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Blues', 'St Louis', 'Central', 'Tom Stillman', 'Doug Armstrong', 'Louie', 1, 4, 424864, 0.2, 20);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Jets', 'Winnipeg', 'Central', 'Mark Chipman', 'Kevin Chevaldayoff', 'Benny', 0, 4, 1850036, 0.0, 21);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Coyotes', 'Arizona', 'Central', 'Xavier Guttierez', 'Bill Armstrong', 'Howler', 0, 2, 3305837, 0.2, 22);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Avalanche', 'Colorado', 'Central', 'Ann Kroenke', 'Chris MacFarland', 'Bernie', 3, 1, 2914660, 0.0, 23);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Wild', 'Minnesota', 'Central', 'Craig Leipold', 'Bill Guerin', 'Nordy', 0, 4, 424864, 0.2, 24);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Ducks', 'Anaheim', 'Pacific', 'Henry Sameuli', 'Pat Verbeek', 'Wild Wing', 1, 4, 1850036, 0.0, 25);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Kings', 'Los Angeles', 'Pacific', 'Philip Anschutz', 'Rob Blake', 'Bailey', 2, 2, 3305837, 0.2, 26);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Sharks', 'San Jose', 'Pacific', 'Hasso Plattner', 'Mike Grier', 'SJ Sharkie', 0, 1, 2914660, 0.0, 27);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Canucks', 'Vancouver', 'Pacific', 'Francisco Aqualini', 'Patrick Allvin', 'Fin', 0, 4, 424864, 0.2, 28);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Oilers', 'Edmonton', 'Pacific', 'Darly Katz', 'Ken Holland', 'Hunter', 5, 4, 1850036, 0.0, 29);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Flames', 'Calgary', 'Pacific', 'N. Murray Edwards', 'Brad Treliving', 'Harvey', 1, 2, 3305837, 0.2, 30);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('GoldenKnights', 'Vegas', 'Pacific', 'Bill Foley', 'Kelly McCrimmon', 'Chance', 0, 0, 2914660, 0.0, 31);
insert into Team (TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, SalaryCapSpace, StateTaxRate, Coach) values ('Kraken', 'Seattle', 'Pacific', 'David Bonderman', 'Ron Francis', 'Buoy', 0, 4, 424864, 0.2, 32);

insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Jack', 'Hughes', 21, 71, 180, 'USA', 'center', 2230430, 3483597, 96428, 'Devils');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Igor', 'Shesterkin', 39, 72, 196, 'Russia', 'goaltender', 12151132, 9103757, 80656, 'Rangers');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Sebastian', 'Aho', 21, 75, 181, 'Finland', 'center', 4547713, 4135566, 66516, 'Hurricanes');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Kris', 'Letang', 19, 72, 188, 'Canada', 'defenseman', 2505735, 2305441, 22787, 'Penguins');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Carter', 'Hart', 21, 71, 180, 'Canada', 'goaltender', 2230430, 3483597, 96428, 'Flyers');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Alexander', 'Ovechkin', 39, 72, 196, 'Russia', 'winger', 12151132, 9103757, 80656, 'Capitals');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Patrik', 'Laine', 21, 75, 181, 'Finland', 'winger', 4547713, 4135566, 66516, 'BlueJackets');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Ilya', 'Sorokin', 19, 72, 188, 'Russia', 'goaltender', 2505735, 2305441, 22787, 'Islanders');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Brad', 'Marchand', 21, 71, 180, 'Canada', 'winger', 2230430, 3483597, 96428, 'Bruins');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Tage', 'Thompson', 39, 72, 196, 'USA', 'center', 12151132, 9103757, 80656, 'Sabres');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Dylan', 'Larkin', 21, 75, 181, 'USA', 'center', 4547713, 4135566, 66516, 'Redwings');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Nick', 'Suzuki', 19, 72, 188, 'Canada', 'center', 2505735, 2305441, 22787, 'Canadiens');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Auston', 'Matthews', 21, 71, 180, 'USA', 'center', 2230430, 3483597, 96428, 'MapleLeafs');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Tim', 'Stutzle', 39, 72, 196, 'Germany', 'winger', 12151132, 9103757, 80656, 'Senators');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Andrei', 'Vasilevski', 21, 75, 181, 'Russia', 'goaltender', 4547713, 4135566, 66516, 'Lightning');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Aleksandr', 'Barkov', 19, 72, 188, 'Russia', 'center', 2505735, 2305441, 22787, 'Panthers');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Juuse', 'Saros', 21, 71, 180, 'Finland', 'goaltender', 2230430, 3483597, 96428, 'Predators');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Patrick', 'Kanen', 39, 72, 196, 'USA', 'winger', 12151132, 9103757, 80656, 'BlackHawks');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Jason', 'Robertson', 21, 75, 181, 'USA', 'winger', 4547713, 4135566, 66516, 'Stars');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Vladimir', 'Tarasenko', 19, 72, 188, 'Russia', 'winger', 2505735, 2305441, 22787, 'Blues');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Connor', 'Hellebyuck', 21, 71, 180, 'USA', 'goaltender', 2230430, 3483597, 96428, 'Jets');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Clayton', 'Keller', 39, 72, 196, 'Canada', 'center', 12151132, 9103757, 80656, 'Coyotes');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Cale', 'Makar', 21, 75, 181, 'Canada', 'defenseman', 4547713, 4135566, 66516, 'Avalanche');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Kirill', 'Kaprizov', 19, 72, 188, 'Russia', 'winger', 2505735, 2305441, 22787, 'Wild');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Trevor', 'Zegras', 21, 71, 180, 'USA', 'center', 2230430, 3483597, 96428, 'Ducks');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Drew', 'Doughty', 39, 72, 196, 'Canada', 'defenseman', 12151132, 9103757, 80656, 'Kings');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Erik', 'Karlsson', 21, 75, 181, 'Sweden', 'defenseman', 4547713, 4135566, 66516, 'Sharks');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Quinn', 'Hughes', 19, 72, 188, 'USA', 'defenseman', 2505735, 2305441, 22787, 'Canucks');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Connor', 'McDavid', 21, 71, 180, 'Canada', 'center', 2230430, 3483597, 96428, 'Oilers');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Jacob', 'Markstrom', 39, 72, 196, 'Sweden', 'goaltender', 12151132, 9103757, 80656, 'Flames');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Mark', 'Stone', 21, 75, 181, 'Canada', 'winger', 4547713, 4135566, 66516, 'GoldenKnights');
insert into Player (FirstName, LastName, Age, Height, Weight_, Nationality, Position, Salary, SigningBonuses, PerformanceBonuses, TeamName) values ('Oliver', 'Bjorkstrand', 19, 72, 188, 'Sweden', 'winger', 2505735, 2305441, 22787, 'Kraken');

insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Devils', 'Prudential_Center', 17552, 15729, 228, 4797, 5488);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Rangers', 'Madison_Square_Garden', 17628, 17580, 106, 9663, 7909);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Hurricanes', 'PNC_Arena', 17435, 16289, 161, 6525, 2067);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Penguins', 'PPG_Paints_Arena', 19815, 17014, 54, 4904, 5456);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Flyers', 'Wells_Fargo_Center', 17552, 15729, 228, 4797, 5488);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Capitals', 'Capital_One_Arena', 17628, 17580, 106, 9663, 7909);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('BlueJackets', 'Nationwide_Arena', 17435, 16289, 161, 6525, 2067);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Islanders', 'UBS_Arena', 19815, 17014, 54, 4904, 5456);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Bruins', 'TD_Garden', 17552, 15729, 228, 4797, 5488);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Sabres', 'KeyBank_Center', 17628, 17580, 106, 9663, 7909);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Redwings', 'Little_Ceasars_Arena', 17435, 16289, 161, 6525, 2067);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Canadiens', 'Bell_Center', 19815, 17014, 54, 4904, 5456);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('MapleLeafs', 'Scotiabank_Arena', 17552, 15729, 228, 4797, 5488);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Senators', 'Canadian_Tire_Center', 17628, 17580, 106, 9663, 7909);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Lightning', 'Amalie_Arena', 17435, 16289, 161, 6525, 2067);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Panthers', 'FLA_Live_Arena', 19815, 17014, 54, 4904, 5456);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Predators', 'Bridgestone_Arena', 17552, 15729, 228, 4797, 5488);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('BlackHawks', 'United_Center', 17628, 17580, 106, 9663, 7909);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Stars', 'American_Airlines_Center', 17435, 16289, 161, 6525, 2067);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Blues', 'Enterprise_Center', 19815, 17014, 54, 4904, 5456);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Jets', 'Canada_Life_Center', 17552, 15729, 228, 4797, 5488);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Coyotes', 'Mullett_Arena', 17628, 17580, 106, 9663, 7909);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Avalanche', 'Ball_Arena', 17435, 16289, 161, 6525, 2067);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Wild', 'Xcel_Energy_Arena', 19815, 17014, 54, 4904, 5456);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Ducks', 'Honda_Center', 17552, 15729, 228, 4797, 5488);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Kings', 'Crypto.com_Arena', 17628, 17580, 106, 9663, 7909);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Sharks', 'SAP_Center', 17435, 16289, 161, 6525, 2067);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Canucks', 'Rogers_Arena', 19815, 17014, 54, 4904, 5456);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Oilers', 'Rogers_Place', 17552, 15729, 228, 4797, 5488);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Flames', 'Scotiabank_Saddledome', 17628, 17580, 106, 9663, 7909);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('GoldenKnights', 'Tmobile_Arena', 17435, 16289, 161, 6525, 2067);
insert into Arena (TeamName, ArenaName, Capacity, AvgAttendance, AvgTicketPrice, AvgConcessionRevenue, AvgMerchRevenue) values ('Kraken', 'Climate_Pledge_Arena', 19815, 17014, 54, 4904, 5456);

insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (1, 2021, 9, 19, 231, 6.987);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (3, 2021, 23, 43, 52, 25.59);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (4, 2021, 43, 6, 51, 16.907);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (6, 2021, 16, 52, 20, 18.849);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (7, 2021, 14, 12, 45, 7.304);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (9, 2021, 0, 39, 189, 21.406);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (10, 2021, 15, 10, 239, 7.9);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (11, 2021, 13, 64, 121, 21.781);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (12, 2021, 2, 0, 238, 24.441);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (13, 2021, 15, 22, 134, 26.229);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (14, 2021, 34, 69, 22, 6.54);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (16, 2021, 19, 64, 62, 17.572);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (18, 2021, 22, 12, 144, 20.124);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (19, 2021, 20, 44, 100, 9.018);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (20, 2021, 14, 64, 19, 18.653);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (22, 2021, 7, 28, 120, 10.29);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (23, 2021, 42, 42, 2, 26.616);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (24, 2021, 47, 11, 237, 13.731);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (25, 2021, 27, 63, 71, 22.076);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (26, 2021, 28, 52, 161, 6.074);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (27, 2021, 6, 43, 237, 19.106);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (28, 2021, 6, 40, 24, 22.042);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (29, 2021, 45, 20, 224, 18.638);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (31, 2021, 18, 66, 239, 13.256);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (32, 2021, 2, 63, 129, 18.63);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (1, 2020, 25, 46, 174, 13.347);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (3, 2020, 32, 59, 178, 12.746);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (4, 2020, 36, 11, 210, 10.712);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (6, 2020, 35, 31, 168, 20.78);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (7, 2020, 47, 41, 92, 9.525);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (9, 2020, 19, 56, 18, 11.37);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (10, 2020, 33, 10, 200, 7.691);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (11, 2020, 48, 48, 134, 13.508);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (12, 2020, 3, 44, 172, 20.79);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (13, 2020, 47, 45, 232, 6.901);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (14, 2020, 17, 51, 49, 27.129);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (16, 2020, 46, 34, 134, 24.219);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (18, 2020, 3, 45, 114, 23.985);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (19, 2020, 3, 18, 147, 17.194);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (20, 2020, 32, 69, 155, 14.715);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (22, 2020, 44, 17, 168, 24.966);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (23, 2020, 5, 49, 207, 25.011);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (24, 2020, 45, 8, 54, 10.696);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (25, 2020, 43, 30, 134, 20.692);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (26, 2020, 12, 68, 134, 9.919);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (27, 2020, 48, 11, 112, 8.43);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (28, 2020, 24, 1, 60, 7.513);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (29, 2020, 26, 38, 248, 27.994);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (31, 2020, 20, 60, 246, 23.879);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (32, 2020, 3, 3, 194, 17.465);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (1, 2019, 36, 18, 248, 13.859);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (3, 2019, 20, 54, 95, 26.533);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (4, 2019, 4, 5, 140, 25.439);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (6, 2019, 39, 39, 46, 9.244);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (7, 2019, 34, 47, 161, 24.381);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (9, 2019, 44, 46, 128, 12.312);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (10, 2019, 23, 24, 13, 7.426);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (11, 2019, 45, 33, 218, 17.683);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (12, 2019, 18, 16, 68, 18.67);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (13, 2019, 46, 61, 70, 18.451);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (14, 2019, 5, 16, 216, 18.132);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (16, 2019, 48, 31, 140, 20.367);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (18, 2019, 50, 50, 162, 22.428);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (19, 2019, 29, 43, 186, 7.221);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (20, 2019, 0, 49, 112, 6.041);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (22, 2019, 13, 22, 173, 27.945);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (23, 2019, 20, 59, 142, 7.906);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (24, 2019, 47, 35, 147, 21.244);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (25, 2019, 17, 9, 139, 18.027);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (26, 2019, 3, 28, 116, 20.285);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (27, 2019, 6, 63, 146, 18.086);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (28, 2019, 23, 52, 226, 11.035);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (29, 2019, 3, 0, 128, 20.655);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (31, 2019, 13, 44, 51, 21.532);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (32, 2019, 33, 21, 118, 17.046);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (1, 2018, 8, 13, 159, 20.457);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (3, 2018, 21, 6, 174, 21.893);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (4, 2018, 28, 50, 42, 25.917);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (6, 2018, 13, 7, 150, 17.394);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (7, 2018, 41, 2, 72, 6.684);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (9, 2018, 39, 38, 58, 10.311);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (10, 2018, 10, 25, 111, 10.069);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (11, 2018, 36, 65, 56, 10.786);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (12, 2018, 1, 55, 77, 27.812);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (13, 2018, 18, 12, 124, 11.742);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (14, 2018, 49, 64, 0, 22.734);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (16, 2018, 22, 59, 152, 26.702);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (18, 2018, 14, 29, 204, 8.987);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (19, 2018, 32, 49, 205, 25.31);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (20, 2018, 3, 22, 55, 10.311);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (22, 2018, 14, 56, 158, 11.427);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (23, 2018, 13, 65, 0, 7.357);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (24, 2018, 7, 68, 27, 20.867);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (25, 2018, 2, 32, 248, 13.257);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (26, 2018, 48, 34, 155, 10.187);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (27, 2018, 1, 5, 108, 18.416);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (28, 2018, 49, 69, 31, 20.668);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (29, 2018, 0, 53, 153, 15.922);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (31, 2018, 31, 48, 99, 21.864);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (32, 2018, 8, 17, 192, 10.137);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (1, 2017, 39, 11, 113, 24.114);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (3, 2017, 20, 59, 221, 24.922);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (4, 2017, 43, 66, 193, 16.221);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (6, 2017, 7, 36, 143, 13.653);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (7, 2017, 30, 64, 209, 6.155);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (9, 2017, 18, 48, 125, 21.844);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (10, 2017, 1, 55, 239, 17.81);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (11, 2017, 5, 41, 223, 8.876);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (12, 2017, 2, 57, 196, 16.414);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (13, 2017, 42, 54, 74, 15.772);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (14, 2017, 8, 43, 232, 14.83);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (16, 2017, 8, 54, 123, 7.67);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (18, 2017, 26, 56, 171, 12.782);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (19, 2017, 0, 55, 192, 9.967);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (20, 2017, 36, 39, 29, 20.194);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (22, 2017, 38, 68, 84, 16.797);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (23, 2017, 3, 68, 80, 8.432);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (24, 2017, 9, 20, 130, 15.656);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (25, 2017, 17, 18, 184, 10.218);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (26, 2017, 38, 20, 103, 15.488);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (27, 2017, 33, 69, 190, 12.379);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (28, 2017, 32, 62, 85, 13.089);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (29, 2017, 42, 10, 210, 26.7);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (31, 2017, 34, 38, 191, 24.057);
insert into StatsBySeason (Player, Season, Goals, Assists, Hits, ATOI) values (32, 2017, 7, 61, 218, 11.668);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (2, 2021, 0.899, 1.773);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (5, 2021, 0.896, 3.709);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (8, 2021, 0.983, 1.238);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (15, 2021, 0.98, 3.384);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (17, 2021, 0.993, 2.356);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (21, 2021, 0.872, 3.569);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (30, 2021, 0.892, 3.029);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (2, 2020, 0.917, 3.673);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (5, 2020, 0.96, 2.352);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (8, 2020, 0.856, 3.785);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (15, 2020, 0.941, 1.894);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (17, 2020, 0.945, 3.196);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (21, 2020, 0.865, 1.351);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (30, 2020, 0.923, 1.689);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (2, 2019, 0.989, 3.88);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (5, 2019, 0.878, 3.648);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (8, 2019, 0.971, 1.43);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (15, 2019, 0.969, 2.52);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (17, 2019, 0.876, 2.016);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (21, 2019, 0.973, 3.479);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (30, 2019, 0.852, 2.075);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (2, 2018, 0.963, 1.123);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (5, 2018, 0.963, 2.845);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (8, 2018, 0.987, 3.193);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (15, 2018, 0.93, 3.815);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (17, 2018, 0.973, 2.257);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (21, 2018, 0.938, 3.235);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (30, 2018, 0.859, 1.921);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (2, 2017, 0.853, 2.11);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (5, 2017, 0.893, 1.997);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (8, 2017, 0.94, 1.676);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (15, 2017, 0.974, 2.786);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (17, 2017, 0.929, 2.283);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (21, 2017, 0.979, 3.099);
insert into StatsBySeason (Player, Season, SavePct, GAA) values (30, 2017, 0.95, 1.48);

insert into RecordBySeason (Team, Season, Record) values ('Devils', 2021, '67-80-0');
insert into RecordBySeason (Team, Season, Record) values ('Rangers', 2021, '05-74-3');
insert into RecordBySeason (Team, Season, Record) values ('Hurricanes', 2021, '63-33-6');
insert into RecordBySeason (Team, Season, Record) values ('Penguins', 2021, '76-46-0');
insert into RecordBySeason (Team, Season, Record) values ('Flyers', 2021, '48-67-7');
insert into RecordBySeason (Team, Season, Record) values ('Capitals', 2021, '52-45-0');
insert into RecordBySeason (Team, Season, Record) values ('BlueJackets', 2021, '77-63-8');
insert into RecordBySeason (Team, Season, Record) values ('Islanders', 2021, '19-31-1');
insert into RecordBySeason (Team, Season, Record) values ('Bruins', 2021, '87-71-2');
insert into RecordBySeason (Team, Season, Record) values ('Sabres', 2021, '17-52-2');
insert into RecordBySeason (Team, Season, Record) values ('Redwings', 2021, '67-53-6');
insert into RecordBySeason (Team, Season, Record) values ('Canadiens', 2021, '52-84-8');
insert into RecordBySeason (Team, Season, Record) values ('MapleLeafs', 2021, '19-93-8');
insert into RecordBySeason (Team, Season, Record) values ('Senators', 2021, '75-16-5');
insert into RecordBySeason (Team, Season, Record) values ('Lightning', 2021, '60-42-8');
insert into RecordBySeason (Team, Season, Record) values ('Panthers', 2021, '30-08-1');
insert into RecordBySeason (Team, Season, Record) values ('Predators', 2021, '70-64-3');
insert into RecordBySeason (Team, Season, Record) values ('BlackHawks', 2021, '85-46-4');
insert into RecordBySeason (Team, Season, Record) values ('Stars', 2021, '95-28-2');
insert into RecordBySeason (Team, Season, Record) values ('Blues', 2021, '19-95-4');
insert into RecordBySeason (Team, Season, Record) values ('Jets', 2021, '63-89-6');
insert into RecordBySeason (Team, Season, Record) values ('Coyotes', 2021, '96-61-5');
insert into RecordBySeason (Team, Season, Record) values ('Avalanche', 2021, '31-30-3');
insert into RecordBySeason (Team, Season, Record) values ('Wild', 2021, '79-68-2');
insert into RecordBySeason (Team, Season, Record) values ('Ducks', 2021, '98-12-0');
insert into RecordBySeason (Team, Season, Record) values ('Kings', 2021, '78-85-9');
insert into RecordBySeason (Team, Season, Record) values ('Sharks', 2021, '21-24-6');
insert into RecordBySeason (Team, Season, Record) values ('Canucks', 2021, '10-13-4');
insert into RecordBySeason (Team, Season, Record) values ('Oilers', 2021, '81-64-9');
insert into RecordBySeason (Team, Season, Record) values ('Flames', 2021, '81-74-1');
insert into RecordBySeason (Team, Season, Record) values ('GoldenKnights', 2021, '67-84-2');
insert into RecordBySeason (Team, Season, Record) values ('Kraken', 2021, '58-23-7');
insert into RecordBySeason (Team, Season, Record) values ('Devils', 2020, '88-62-0');
insert into RecordBySeason (Team, Season, Record) values ('Rangers', 2020, '15-60-4');
insert into RecordBySeason (Team, Season, Record) values ('Hurricanes', 2020, '37-20-8');
insert into RecordBySeason (Team, Season, Record) values ('Penguins', 2020, '42-24-7');
insert into RecordBySeason (Team, Season, Record) values ('Flyers', 2020, '44-06-9');
insert into RecordBySeason (Team, Season, Record) values ('Capitals', 2020, '06-93-7');
insert into RecordBySeason (Team, Season, Record) values ('BlueJackets', 2020, '94-93-9');
insert into RecordBySeason (Team, Season, Record) values ('Islanders', 2020, '36-65-1');
insert into RecordBySeason (Team, Season, Record) values ('Bruins', 2020, '01-70-2');
insert into RecordBySeason (Team, Season, Record) values ('Sabres', 2020, '27-47-8');
insert into RecordBySeason (Team, Season, Record) values ('Redwings', 2020, '25-36-6');
insert into RecordBySeason (Team, Season, Record) values ('Canadiens', 2020, '64-78-9');
insert into RecordBySeason (Team, Season, Record) values ('MapleLeafs', 2020, '77-78-7');
insert into RecordBySeason (Team, Season, Record) values ('Senators', 2020, '37-56-2');
insert into RecordBySeason (Team, Season, Record) values ('Lightning', 2020, '47-13-7');
insert into RecordBySeason (Team, Season, Record) values ('Panthers', 2020, '52-83-7');
insert into RecordBySeason (Team, Season, Record) values ('Predators', 2020, '44-38-4');
insert into RecordBySeason (Team, Season, Record) values ('BlackHawks', 2020, '54-66-6');
insert into RecordBySeason (Team, Season, Record) values ('Stars', 2020, '20-72-9');
insert into RecordBySeason (Team, Season, Record) values ('Blues', 2020, '93-61-7');
insert into RecordBySeason (Team, Season, Record) values ('Jets', 2020, '49-07-3');
insert into RecordBySeason (Team, Season, Record) values ('Coyotes', 2020, '78-57-3');
insert into RecordBySeason (Team, Season, Record) values ('Avalanche', 2020, '00-82-4');
insert into RecordBySeason (Team, Season, Record) values ('Wild', 2020, '61-97-0');
insert into RecordBySeason (Team, Season, Record) values ('Ducks', 2020, '05-57-4');
insert into RecordBySeason (Team, Season, Record) values ('Kings', 2020, '63-88-5');
insert into RecordBySeason (Team, Season, Record) values ('Sharks', 2020, '43-45-7');
insert into RecordBySeason (Team, Season, Record) values ('Canucks', 2020, '00-28-3');
insert into RecordBySeason (Team, Season, Record) values ('Oilers', 2020, '87-18-6');
insert into RecordBySeason (Team, Season, Record) values ('Flames', 2020, '12-19-5');
insert into RecordBySeason (Team, Season, Record) values ('GoldenKnights', 2020, '43-77-9');
insert into RecordBySeason (Team, Season, Record) values ('Kraken', 2020, '77-07-5');
insert into RecordBySeason (Team, Season, Record) values ('Devils', 2019, '09-24-5');
insert into RecordBySeason (Team, Season, Record) values ('Rangers', 2019, '25-32-0');
insert into RecordBySeason (Team, Season, Record) values ('Hurricanes', 2019, '01-46-2');
insert into RecordBySeason (Team, Season, Record) values ('Penguins', 2019, '33-25-6');
insert into RecordBySeason (Team, Season, Record) values ('Flyers', 2019, '70-18-4');
insert into RecordBySeason (Team, Season, Record) values ('Capitals', 2019, '35-40-7');
insert into RecordBySeason (Team, Season, Record) values ('BlueJackets', 2019, '99-10-2');
insert into RecordBySeason (Team, Season, Record) values ('Islanders', 2019, '12-53-5');
insert into RecordBySeason (Team, Season, Record) values ('Bruins', 2019, '35-68-7');
insert into RecordBySeason (Team, Season, Record) values ('Sabres', 2019, '97-57-5');
insert into RecordBySeason (Team, Season, Record) values ('Redwings', 2019, '57-88-2');
insert into RecordBySeason (Team, Season, Record) values ('Canadiens', 2019, '99-48-5');
insert into RecordBySeason (Team, Season, Record) values ('MapleLeafs', 2019, '52-73-6');
insert into RecordBySeason (Team, Season, Record) values ('Senators', 2019, '20-12-9');
insert into RecordBySeason (Team, Season, Record) values ('Lightning', 2019, '81-74-4');
insert into RecordBySeason (Team, Season, Record) values ('Panthers', 2019, '94-41-3');
insert into RecordBySeason (Team, Season, Record) values ('Predators', 2019, '28-75-7');
insert into RecordBySeason (Team, Season, Record) values ('BlackHawks', 2019, '49-34-9');
insert into RecordBySeason (Team, Season, Record) values ('Stars', 2019, '58-89-0');
insert into RecordBySeason (Team, Season, Record) values ('Blues', 2019, '49-28-2');
insert into RecordBySeason (Team, Season, Record) values ('Jets', 2019, '05-11-0');
insert into RecordBySeason (Team, Season, Record) values ('Coyotes', 2019, '71-16-2');
insert into RecordBySeason (Team, Season, Record) values ('Avalanche', 2019, '46-42-0');
insert into RecordBySeason (Team, Season, Record) values ('Wild', 2019, '62-63-8');
insert into RecordBySeason (Team, Season, Record) values ('Ducks', 2019, '64-66-9');
insert into RecordBySeason (Team, Season, Record) values ('Kings', 2019, '71-42-1');
insert into RecordBySeason (Team, Season, Record) values ('Sharks', 2019, '82-35-8');
insert into RecordBySeason (Team, Season, Record) values ('Canucks', 2019, '41-57-3');
insert into RecordBySeason (Team, Season, Record) values ('Oilers', 2019, '22-29-6');
insert into RecordBySeason (Team, Season, Record) values ('Flames', 2019, '32-11-1');
insert into RecordBySeason (Team, Season, Record) values ('GoldenKnights', 2019, '42-86-6');
insert into RecordBySeason (Team, Season, Record) values ('Kraken', 2019, '48-53-9');
insert into RecordBySeason (Team, Season, Record) values ('Devils', 2018, '21-60-7');
insert into RecordBySeason (Team, Season, Record) values ('Rangers', 2018, '68-55-8');
insert into RecordBySeason (Team, Season, Record) values ('Hurricanes', 2018, '59-05-3');
insert into RecordBySeason (Team, Season, Record) values ('Penguins', 2018, '83-39-7');
insert into RecordBySeason (Team, Season, Record) values ('Flyers', 2018, '91-31-8');
insert into RecordBySeason (Team, Season, Record) values ('Capitals', 2018, '43-04-9');
insert into RecordBySeason (Team, Season, Record) values ('BlueJackets', 2018, '08-99-5');
insert into RecordBySeason (Team, Season, Record) values ('Islanders', 2018, '51-31-8');
insert into RecordBySeason (Team, Season, Record) values ('Bruins', 2018, '10-59-2');
insert into RecordBySeason (Team, Season, Record) values ('Sabres', 2018, '58-45-6');
insert into RecordBySeason (Team, Season, Record) values ('Redwings', 2018, '45-48-9');
insert into RecordBySeason (Team, Season, Record) values ('Canadiens', 2018, '18-85-1');
insert into RecordBySeason (Team, Season, Record) values ('MapleLeafs', 2018, '71-01-5');
insert into RecordBySeason (Team, Season, Record) values ('Senators', 2018, '02-81-6');
insert into RecordBySeason (Team, Season, Record) values ('Lightning', 2018, '67-29-9');
insert into RecordBySeason (Team, Season, Record) values ('Panthers', 2018, '08-44-3');
insert into RecordBySeason (Team, Season, Record) values ('Predators', 2018, '58-57-6');
insert into RecordBySeason (Team, Season, Record) values ('BlackHawks', 2018, '59-90-9');
insert into RecordBySeason (Team, Season, Record) values ('Stars', 2018, '96-53-2');
insert into RecordBySeason (Team, Season, Record) values ('Blues', 2018, '06-55-1');
insert into RecordBySeason (Team, Season, Record) values ('Jets', 2018, '33-76-4');
insert into RecordBySeason (Team, Season, Record) values ('Coyotes', 2018, '37-60-2');
insert into RecordBySeason (Team, Season, Record) values ('Avalanche', 2018, '36-92-5');
insert into RecordBySeason (Team, Season, Record) values ('Wild', 2018, '39-08-8');
insert into RecordBySeason (Team, Season, Record) values ('Ducks', 2018, '16-22-4');
insert into RecordBySeason (Team, Season, Record) values ('Kings', 2018, '54-03-7');
insert into RecordBySeason (Team, Season, Record) values ('Sharks', 2018, '97-16-6');
insert into RecordBySeason (Team, Season, Record) values ('Canucks', 2018, '06-71-2');
insert into RecordBySeason (Team, Season, Record) values ('Oilers', 2018, '34-49-4');
insert into RecordBySeason (Team, Season, Record) values ('Flames', 2018, '11-48-2');
insert into RecordBySeason (Team, Season, Record) values ('GoldenKnights', 2018, '46-83-2');
insert into RecordBySeason (Team, Season, Record) values ('Kraken', 2018, '18-64-8');
insert into RecordBySeason (Team, Season, Record) values ('Devils', 2017, '29-56-1');
insert into RecordBySeason (Team, Season, Record) values ('Rangers', 2017, '66-53-5');
insert into RecordBySeason (Team, Season, Record) values ('Hurricanes', 2017, '35-07-5');
insert into RecordBySeason (Team, Season, Record) values ('Penguins', 2017, '83-96-4');
insert into RecordBySeason (Team, Season, Record) values ('Flyers', 2017, '66-36-3');
insert into RecordBySeason (Team, Season, Record) values ('Capitals', 2017, '16-79-8');
insert into RecordBySeason (Team, Season, Record) values ('BlueJackets', 2017, '87-22-6');
insert into RecordBySeason (Team, Season, Record) values ('Islanders', 2017, '64-15-9');
insert into RecordBySeason (Team, Season, Record) values ('Bruins', 2017, '77-66-1');
insert into RecordBySeason (Team, Season, Record) values ('Sabres', 2017, '97-35-0');
insert into RecordBySeason (Team, Season, Record) values ('Redwings', 2017, '80-10-2');
insert into RecordBySeason (Team, Season, Record) values ('Canadiens', 2017, '85-98-4');
insert into RecordBySeason (Team, Season, Record) values ('MapleLeafs', 2017, '60-49-3');
insert into RecordBySeason (Team, Season, Record) values ('Senators', 2017, '07-65-4');
insert into RecordBySeason (Team, Season, Record) values ('Lightning', 2017, '94-31-8');
insert into RecordBySeason (Team, Season, Record) values ('Panthers', 2017, '18-01-4');
insert into RecordBySeason (Team, Season, Record) values ('Predators', 2017, '75-99-5');
insert into RecordBySeason (Team, Season, Record) values ('BlackHawks', 2017, '13-36-2');
insert into RecordBySeason (Team, Season, Record) values ('Stars', 2017, '45-34-1');
insert into RecordBySeason (Team, Season, Record) values ('Blues', 2017, '23-57-1');
insert into RecordBySeason (Team, Season, Record) values ('Jets', 2017, '58-17-5');
insert into RecordBySeason (Team, Season, Record) values ('Coyotes', 2017, '00-79-1');
insert into RecordBySeason (Team, Season, Record) values ('Avalanche', 2017, '11-28-5');
insert into RecordBySeason (Team, Season, Record) values ('Wild', 2017, '39-34-3');
insert into RecordBySeason (Team, Season, Record) values ('Ducks', 2017, '81-10-8');
insert into RecordBySeason (Team, Season, Record) values ('Kings', 2017, '86-64-8');
insert into RecordBySeason (Team, Season, Record) values ('Sharks', 2017, '24-84-1');
insert into RecordBySeason (Team, Season, Record) values ('Canucks', 2017, '47-10-3');
insert into RecordBySeason (Team, Season, Record) values ('Oilers', 2017, '28-33-0');
insert into RecordBySeason (Team, Season, Record) values ('Flames', 2017, '25-16-1');
insert into RecordBySeason (Team, Season, Record) values ('GoldenKnights', 2017, '11-27-3');
insert into RecordBySeason (Team, Season, Record) values ('Kraken', 2017, '46-07-4');

insert into Fights (Player1, Player2, Winner) values (7, 28, 7);
insert into Fights (Player1, Player2, Winner) values (1, 26, 1);
insert into Fights (Player1, Player2, Winner) values (1, 30, 30);
insert into Fights (Player1, Player2, Winner) values (3, 26, 26);
insert into Fights (Player1, Player2, Winner) values (10, 25, 10);
insert into Fights (Player1, Player2, Winner) values (9, 32, 9);
insert into Fights (Player1, Player2, Winner) values (4, 27, 4);
insert into Fights (Player1, Player2, Winner) values (12, 28, 28);
insert into Fights (Player1, Player2, Winner) values (7, 17, 7);
insert into Fights (Player1, Player2, Winner) values (11, 21, 21);
insert into Fights (Player1, Player2, Winner) values (2, 29, 2);
insert into Fights (Player1, Player2, Winner) values (11, 18, 11);
insert into Fights (Player1, Player2, Winner) values (1, 21, 21);
insert into Fights (Player1, Player2, Winner) values (12, 18, 11);
insert into Fights (Player1, Player2, Winner) values (5, 17, 5);
insert into Fights (Player1, Player2, Winner) values (8, 25, 25);
insert into Fights (Player1, Player2, Winner) values (9, 21, 21);
insert into Fights (Player1, Player2, Winner) values (8, 18, 8);
insert into Fights (Player1, Player2, Winner) values (10, 18, 10);
insert into Fights (Player1, Player2, Winner) values (6, 16, 6);
insert into Fights (Player1, Player2, Winner) values (8, 27, 8);
insert into Fights (Player1, Player2, Winner) values (9, 18, 8);
insert into Fights (Player1, Player2, Winner) values (3, 31, 31);
insert into Fights (Player1, Player2, Winner) values (3, 30, 30);
insert into Fights (Player1, Player2, Winner) values (11, 17, 17);
insert into Fights (Player1, Player2, Winner) values (2, 28, 2);
insert into Fights (Player1, Player2, Winner) values (13, 18, 18);
insert into Fights (Player1, Player2, Winner) values (7, 16, 7);
insert into Fights (Player1, Player2, Winner) values (7, 23, 7);
insert into Fights (Player1, Player2, Winner) values (14, 20, 14);
insert into Fights (Player1, Player2, Winner) values (2, 21, 2);
insert into Fights (Player1, Player2, Winner) values (8, 29, 8);
insert into Fights (Player1, Player2, Winner) values (7, 22, 7);
insert into Fights (Player1, Player2, Winner) values (15, 24, 15);
insert into Fights (Player1, Player2, Winner) values (12, 20, 12);
insert into Fights (Player1, Player2, Winner) values (3, 19, 3);
insert into Fights (Player1, Player2, Winner) values (14, 19, 14);
insert into Fights (Player1, Player2, Winner) values (11, 25, 11);
insert into Fights (Player1, Player2, Winner) values (5, 24, 5);
insert into Fights (Player1, Player2, Winner) values (13, 22, 13);
insert into Fights (Player1, Player2, Winner) values (15, 18, 15);
insert into Fights (Player1, Player2, Winner) values (6, 27, 6);
insert into Fights (Player1, Player2, Winner) values (14, 26, 14);
insert into Fights (Player1, Player2, Winner) values (3, 20, 3);
insert into Fights (Player1, Player2, Winner) values (9, 29, 9);
insert into Fights (Player1, Player2, Winner) values (2, 30, 2);
insert into Fights (Player1, Player2, Winner) values (12, 22, 12);
insert into Fights (Player1, Player2, Winner) values (9, 30, 30);
insert into Fights (Player1, Player2, Winner) values (4, 30, 30);
insert into Fights (Player1, Player2, Winner) values (3, 32, 3);
insert into Fights (Player1, Player2, Winner) values (8, 23, 7);
insert into Fights (Player1, Player2, Winner) values (14, 27, 14);
insert into Fights (Player1, Player2, Winner) values (13, 25, 13);
insert into Fights (Player1, Player2, Winner) values (2, 19, 19);
insert into Fights (Player1, Player2, Winner) values (15, 28, 15);
insert into Fights (Player1, Player2, Winner) values (3, 22, 3);
insert into Fights (Player1, Player2, Winner) values (5, 22, 5);
insert into Fights (Player1, Player2, Winner) values (7, 31, 7);
insert into Fights (Player1, Player2, Winner) values (4, 16, 4);
insert into Fights (Player1, Player2, Winner) values (11, 30, 30);
insert into Fights (Player1, Player2, Winner) values (2, 24, 24);
insert into Fights (Player1, Player2, Winner) values (9, 28, 28);
insert into Fights (Player1, Player2, Winner) values (11, 19, 11);
insert into Fights (Player1, Player2, Winner) values (10, 26, 10);
insert into Fights (Player1, Player2, Winner) values (4, 17, 17);
insert into Fights (Player1, Player2, Winner) values (9, 26, 9);
insert into Fights (Player1, Player2, Winner) values (1, 24, 1);
insert into Fights (Player1, Player2, Winner) values (10, 20, 10);
insert into Fights (Player1, Player2, Winner) values (14, 32, 14);
insert into Fights (Player1, Player2, Winner) values (15, 32, 15);