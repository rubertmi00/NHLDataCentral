from flask import Blueprint, request, jsonify, make_response
import json
from src import db


fans = Blueprint('fans', __name__)

# Get all teams from the DB
@fans.route('/teams', methods=['GET'])
def get_teams():
    cursor = db.get_db().cursor()
    cursor.execute('select TeamName, Location_ from Team')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get team details for fans with particular teamName
@fans.route('/teams/<teamName>', methods=['GET'])
def get_team(teamName):
    cursor = db.get_db().cursor()
    cursor.execute("select * from Team where TeamName = '{0}'".format(teamName))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get team records by particular teamName
@fans.route('/teams/records/<teamName>', methods=['GET'])
def get_team_records(teamName):
    cursor = db.get_db().cursor()
    cursor.execute("select Season, Record from RecordBySeason where Team = '{0}'".format(teamName))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get coach info by particular Id
@fans.route('/coaches/<ID>', methods=['GET'])
def get_coach(ID):
    cursor = db.get_db().cursor()
    cursor.execute("select * from Coach where Id = '{0}'".format(ID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Add a team to the DB
@fans.route('/addteam', methods=['POST'])
def add_team():
    cursor = db.get_db().cursor()
    team_name = request.form['team_name']
    location = request.form['location']
    division = request.form['division']
    owner = request.form['owner']
    gm = request.form['gm']
    mascot = request.form['mascot']
    stanley_cups = request.form['stanley_cups']
    presidents_trophies = request.form['presidents_trophies']
    coach_id = request.form['coach_id']
    query = "insert into Team(TeamName, Location_, Division, Owner_, GM, Mascot, StanleyCups, PresidentsTrophies, Coach) values('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', {6}, {7}, {8})".format(team_name, location, division, owner, gm, mascot, stanley_cups, presidents_trophies, coach_id)
    cursor.execute(query)
    db.get_db().commit()
    return 'Success!'