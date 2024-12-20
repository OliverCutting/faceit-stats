import requests
import json
import statistics
import os

api_endpoint = "https://open.faceit.com/data/v4/"
headers = { "Authorization":  os.environ['FACEIT_API_KEY']}


def get_player_id(user):
  response = requests.get(url=f"{api_endpoint}players?nickname={user}&game=cs2", headers=headers)
  player_id = json.loads(response.text)['player_id']
  return player_id

def get_games(user):
  player_id = get_player_id(user)
  response = requests.get(url=f'{api_endpoint}players/{player_id}/games/cs2/stats', headers=headers)
  matches = json.loads(response.text)['items']
  return matches

def mean_kills(user):
  games = get_games(user)
  kills_in_20 = []
  for game in games:
    kills_in_20.append(int(game['stats']['Kills']))
  avg_kills = round(statistics.mean(kills_in_20))
  return avg_kills

def median_kills(user):
  games = get_games(user)
  kills_in_20 = []
  for game in games:
    kills_in_20.append(int(game['stats']['Kills']))
  median_kills = round(statistics.median(kills_in_20))
  return median_kills
