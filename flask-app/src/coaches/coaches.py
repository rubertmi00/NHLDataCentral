from flask import Blueprint, request, jsonify, make_response
import json
from src import db


coaches = Blueprint('coaches', __name__)

# Get all players from the DB
@coaches.route('/players', methods=['GET'])
def get_players():
    cursor = db.get_db().cursor()
    cursor.execute('select Id, FirstName, LastName from Player')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get player details for particular player ID
@coaches.route('/players/<playerID>', methods=['GET'])
def get_player(playerID):
    cursor = db.get_db().cursor()
    cursor.execute("select * from Player where Id = '{0}'".format(playerID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get player details for particular player ID
@coaches.route('/players/<playerID>/stats', methods=['GET'])
def get_player_stats(playerID):
    cursor = db.get_db().cursor()
    cursor.execute("select * from StatsBySeason where Player = '{0}'".format(playerID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Add a player to the DB
@coaches.route('/addplayer', methods=['POST'])
def add_player():
    cursor = db.get_db().cursor()
    first_name = request.form['first_name']
    last_name = request.form['last_name']
    age = request.form['age']
    height = request.form['height']
    weight = request.form['weight']
    nationality = request.form['nationality']
    position = request.form['position']
    team = request.form['team']
    query = "insert into Player(FirstName, LastName, Age, Height, Weight_, Nationality, Position, TeamName) values('{0}', '{1}', {2}, {3}, {4}, '{5}', '{6}', '{7}')".format(first_name, last_name, age, height, weight, nationality, position, team)
    cursor.execute(query)
    db.get_db().commit()
    return 'Success!'