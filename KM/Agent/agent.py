#! /usr/bin/python3


from world import World
from player import Player


# GLOBAL VARS =================================================================

WORLD  = World()         # обьект мира
PLAYER = Player(WORLD)   # обьект игрока

# MAIN AGENT FUNC =============================================================

def ChooseAction(percept):
  global WORLD, PLAYER

  # извлечение параметров мира
  worldInfo     = percept['worldinfo']
  monstersCount = int(worldInfo['ismonsteralive'])
  # извлечение параметров игрока
  playerState   = percept['iagent']
  arrowsCount   = int(playerState['arrowcount']) 
  legsCount     = int(playerState['legscount'])
  currDirect    = playerState['dir']
  # извлечение параметров текущей пещеры
  currCave      = percept['currentcave']
  caveRow       = int(currCave['rowN'])
  caveCol       = int(currCave['colN'])
  isGold        = bool(currCave['isGold'])
  isHole        = bool(currCave['isHole'])
  isWind        = bool(currCave['isWind'])
  isBones       = bool(currCave['isBones'])
  allowDirects  = list(currCave['dirList'].keys()) # ["Right", "Down"]

  # обновить состояние мира
  WORLD.updateWorld(caveRow, caveCol, isGold, isHole, isWind, isBones, allowDirects, monstersCount, arrowsCount, legsCount)
  # обновить состояние игрока
  PLAYER.updatePlayer(arrowsCount, legsCount, currDirect)
  # получить текущие действия
  currActs = PLAYER.getActions()

  return currActs
