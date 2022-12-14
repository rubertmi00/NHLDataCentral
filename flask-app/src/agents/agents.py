from flask import Blueprint, request, jsonify, make_response
import json
from src import db


agents = Blueprint('agents', __name__)

# Get all arenas from the DB
@agents.route('/arenas', methods=['GET'])
def get_arenas():
    cursor = db.get_db().cursor()
    cursor.execute('select ArenaName from Arena')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get arena details for particular arenaName
@agents.route('/arenas/<arenaName>', methods=['GET'])
def get_arena(arenaName):
    cursor = db.get_db().cursor()
    cursor.execute("select * from Arena where ArenaName = '{0}'".format(arenaName))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get player financial details for particular player ID
@agents.route('/players/<playerID>', methods=['GET'])
def get_player_financials(playerID):
    cursor = db.get_db().cursor()
    cursor.execute("select Id, Salary, SigningBonuses, PerformanceBonuses from Player where Id = '{0}'".format(playerID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get team financial details for particular team
@agents.route('/teams/<teamName>', methods=['GET'])
def get_team_financials(teamName):
    cursor = db.get_db().cursor()
    cursor.execute("select TeamName, SalaryCapSpace, StateTaxRate from Team where TeamName = '{0}'".format(teamName))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response