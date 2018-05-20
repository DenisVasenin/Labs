#! /usr/bin/python3

import sys
sys.path.append(sys.path[0] + "/data")

import shlex, subprocess, testdata, filecmp
from subprocess import Popen, PIPE
from testdata import ARG_LIST


PROG_CMD = "./build/task1 "
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
  return code


# compare two files
def CompareFiles(file1, file2):
  global TEST_PATH
  path1 = TEST_PATH + file1
  path2 = TEST_PATH + file2
  result = filecmp.cmp(path1, path2)
  if (not result):
    print("File1 ----------------------------------------------")
    print(open(path1, 'r').readlines())
    print("----------------------------------------------------")
    print("File2 ----------------------------------------------")
    print(open(path2, 'r').readlines())
    print("----------------------------------------------------")
  return result


def Check(exitCode, expCode, cmpFile):
  global PASSED_COUNT, FAILED_COUNT
  print("The program was finished with code " + str(exitCode) + ".")
  if (int(exitCode) == expCode):
    if (int(exitCode) == 0):
      if (CompareFiles("output", cmpFile)):
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


def Test(args, expCode, cmpFile, testNum):
  print("Test #" + str(testNum) + " with parms '" + args + "'.")
  exitCode = Run(args, testNum)
  return Check(exitCode, expCode, cmpFile)


def main():
  global ARG_LIST, PASSED_COUNT, FAILED_COUNT
  print()
  for i in range(1, len(ARG_LIST)+1):
    args = ARG_LIST[i-1][0]
    cmpFile = ARG_LIST[i-1][1]
    expCode = ARG_LIST[i-1][2]
    if (Test(args, expCode, cmpFile, i)):
      break
  print("Passed tests: " + str(PASSED_COUNT))
  print("Failed tests: " + str(FAILED_COUNT) + "\n")
  return 0


main()
