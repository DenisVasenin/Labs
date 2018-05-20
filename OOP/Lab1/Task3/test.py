#! /usr/bin/python3

import sys
sys.path.append(sys.path[0] + "/data")

import shlex, subprocess, testdata, filecmp
from subprocess import Popen, PIPE
from testdata import ARG_LIST


PROG_CMD = "./build/invert "
TEST_PATH = "./data/"

PASSED_COUNT = 0
FAILED_COUNT = 0


# run program with arguments
def Run(args, testNum):
  global PROG_CMD
  cmd = shlex.split(PROG_CMD + args)
  proc = subprocess.Popen(cmd, stdout=PIPE)
  proc.wait()
  code = proc.returncode
  result = proc.communicate()[0][0:-1].decode('ascii')
  print("RESULT: " + result)
  return (code, result)


def Check(exitCode, expCode, result, expRes):
  global PASSED_COUNT, FAILED_COUNT
  print("The program was finished with code " + str(exitCode) + ".")
  if (int(exitCode) == expCode):
    if (int(exitCode) == 0):
      if (result == expRes):
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


def Test(args, expCode, expRes, testNum, testInfo):
  print("Test #" + str(testNum) + " with parms '" + args + "'.")
  print("Test info: " + testInfo)
  result = Run(args, testNum)
  return Check(result[0], expCode, result[1], expRes)


def main():
  global ARG_LIST, PASSED_COUNT, FAILED_COUNT
  print()
  for i in range(1, len(ARG_LIST)+1):
    args = ARG_LIST[i-1][0]
    expRes = ARG_LIST[i-1][1]
    testInfo = ARG_LIST[i-1][2]
    expCode = ARG_LIST[i-1][3]
    if (Test(args, expCode, expRes, i, testInfo)):
      break
  print("Passed tests: " + str(PASSED_COUNT))
  print("Failed tests: " + str(FAILED_COUNT) + "\n")
  return 0


main()
