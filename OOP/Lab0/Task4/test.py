#! /usr/bin/python3

import sys
sys.path.append(sys.path[0] + "/data")

import shlex, subprocess, testdata
from subprocess import Popen, PIPE
from testdata import ARG_LIST


PROG_CMD = "./build/task4 "

PASSED_COUNT = 0
FAILED_COUNT = 0


def Run(args, testNum):
  global PROG_CMD
  cmd = shlex.split(PROG_CMD + args)
  proc = subprocess.Popen(cmd, stdout=PIPE)
  proc.wait()
  code = proc.returncode
  result = proc.communicate()[0][0:-1].decode('ascii')
  print("RESULT: " + result)
  return (code, result)


def CheckCode(code, expCode, result, expResult):
  global PASSED_COUNT, FAILED_COUNT
  print("The program was finished with code " + str(code) + ".")
  if (int(code) == expCode):
    if (int(code) == 0):
      if (result == expResult):
        print("Test was passed successfully.\n")
        PASSED_COUNT += 1
        return 0
    else:
      print("Test was passed successfully.\n")
      PASSED_COUNT += 1
      return 0
  print("Test was failed.\n")
  FAILED_COUNT += 1
  return 1


def Test(args, expCode, expResult, testNum):
  print("Test #" + str(testNum) + " with parms '" + args + "'.")
  feedback = Run(args, testNum)
  CheckCode(feedback[0], expCode, feedback[1], expResult)
  return 0


def main():
  global ARG_LIST, PASSED_COUNT, FAILED_COUNT
  print()
  for i in range(1, len(ARG_LIST)+1):
    args = ARG_LIST[i-1][0]
    expCode = ARG_LIST[i-1][1]
    expResult = ARG_LIST[i-1][2]
    Test(args, expCode, expResult, i)
  print("Passed tests: " + str(PASSED_COUNT))
  print("Failed tests: " + str(FAILED_COUNT) + "\n")
  return 0


main()
