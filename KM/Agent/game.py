#! /usr/bin/python3

import requests, urllib3
from agent import ChooseAction

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


# VARS ========================================================================

# Выбор кейса
# 1: L-1 (Поиск клада. Известный Лабиринт. 2 обвала. 1 монстр.)
# 6: L-2 (Поиск клада. Неизвестный Лабиринт. Без обвалов. Без монстра.)
# 7: L-3 (Поиск клада. Неизвестный Лабиринт. 1 обвал. Без монстра)
# 4: L-4 (Поиск клада. Неизвестный Лабиринт. 2 обвала. Без монстра. )
# 2: L-5 (Поиск клада. Неизвестный Лабиринт. 2 обвала. 1 монстр.)

hash = 'c1fb063ea5d746daf128d41586b18dc8' #
user_id = 2840 # заменить на свой user_id
case_id = 5 # Выбор кейса
map_num = 2 # Выбор карты
t_id    = 7 # Турнирный id
url = "https://mooped.net/local/its/game/agentaction/"
url = "https://mooped.net/local/its/tournament/agentaction/"

# https://mooped.net/local/its/tournament/agentaction/?tid=TID&userid=USERID&passive=ACT&active=ACT)

# Вместо tid подставьте id соревнований https://mooped.net/local/its/tournament/index/

# =============================================================================

# запускаем игру, организуем взаимодействие с сервером

def StartGameU(url, case_id, user_id, map_num):
  request = ConnectU(url, case_id, user_id, map_num)
  if (request == None):
    print("Связь с сервером", url, "не установлена")
  else:
    while(request['error'] == None):
      print("------ выбор действия ------")
      percept = request['text']
      act = ChooseAction(percept)
      print("----- действие выбрано -----\n")
      request = ConnectU(url, case_id, user_id, map_num, passivAct = act[0], activAct = act[1])
  print("Код завершения: ", request['error'])
  return(request['error'])


def StartGameH(url, hash):
  request = ConnectH(url, hash)
  if (request == None):
    print("Связь с сервером", url, "не установлена")
  else:
    while(request['error'] == None):
      percept = request['text']
      act = ChooseAction(percept)
      request = ConnectH(url, hash, passivAct = act[0], activAct = act[1])
  print("Код завершения: ", request['error'])
  return(request['error'])
  

def StartGameT(url, t_id, user_id):
  request = ConnectT(url, t_id, user_id)
  if (request == None):
    print("Связь с сервером", url, "не установлена")
  else:
    while(request['error'] == None):
      print("------ выбор действия ------")
      percept = request['text']
      act = ChooseAction(percept)
      print("----- действие выбрано -----\n")
      request = ConnectT(url, t_id, user_id, passivAct = act[0], activAct = act[1])
  print("Код завершения: ", request['error'])
  return(request['error'])


def ConnectU(url, case_id, user_id, map_num=1, passivAct = 'noAct', activAct = 'noAct'):
  resp = requests.get(url, params = { 'caseid': case_id, 'userid': user_id, 'mapnum': map_num, 'passive': passivAct, 'active': activAct }, verify = False)
  if (resp.status_code == 200):
    print("----- соединение установлено -----")
    json1 = resp.json()
  else:
    json1 = None
  return(json1)


def ConnectH(url, hash, passivAct = 'noAct', activAct = 'noAct'):
  resp = requests.get(url, params = { 'hash': hash, 'passive': passivAct, 'active': activAct }, verify = False)
  if (resp.status_code == 200):
    print("----- соединение установлено -----")
    json1 = resp.json()
  else:
    json1 = None
  return(json1)


def ConnectT(url, t_id, user_id, passivAct = 'noAct', activAct = 'noAct'):
  resp = requests.get(url, params = { 'tid': t_id, 'userid': user_id, 'passive': passivAct, 'active': activAct }, verify = False)
  if (resp.status_code == 200):
    print("----- соединение установлено -----")
    json1 = resp.json()
  else:
    json1 = None
  return(json1)

# ЗАПУСК РАБОТЫ АГЕНТА ========================================================

#StartGameU(url, case_id, user_id, map_num)
#StartGameH(url, hash)
StartGameT(url, t_id, user_id)