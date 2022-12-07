# NHL Data Central

This repo contains the backend setup for spinning up 2 docker containers: 
1. A MySQL 8 container to host the NHL database
2. A Python Flask container to implement a REST API

## How to setup and start the containers
**Important** - you need Docker Desktop installed

1. Clone this repository.  
2. Create a file named `db_root_password.txt` in the `secrets/` folder and put inside of it the root password for MySQL. 
3. Create a file named `db_password.txt` in the `secrets/` folder and put inside of it the password you want to use for the `webapp` user. 
4. In a terminal or command prompt, navigate to the folder with the `docker-compose.yml` file.  
5. Build the images with `docker compose build`
6. Start the containers with `docker compose up`.  To run in detached mode, run `docker compose up -d`. 

## For setting up a Conda Web-Dev environment:

1. `conda create -n webdev python=3.9`
2. `conda activate webdev`
3. `pip install flask flask-mysql flask-restful cryptography flask-login`

## Video Walkthrough/Demo:
https://www.youtube.com/watch?v=gQfepC97Mgo

## Personas:
1. Fan – Team level data/stats
2. Coach – Player level data/stats
3. Agent – Financial data

## API Routes:
This API consists of 14 routes, including two capable of handling POST requests. The routes provide the following functions
- List all teams
- Get data for a specific team
- Get a team's season-by-season records
- Get data for a specific coach
- Add a new team to the database

- List all players
- Get data for a specific player
- Get a player's season-by-season stats
- Get records of every fight involving a player
- Add a new player to the database

- List all arenas
- Get financial data for a specific arena
- Get financial data for a specific player
- Get financial data for a specific team

## Bootstrap Data:
This repository features a bootstrap SQL to begin populating the database. This bootstrap will add 32 records each to the Team, Coach, Player, and Arena tables (one for each NHL team), as well as 160 records to the StatsBySeason and RecordsBySeason table (5 years worth for each player/team). Additionally, about 70 fights have been added to the Fight table.

## Frontend:
The associated frontend for this project can be found on Mark Fontenot's AppSmith server, under the name NHL Data Central
