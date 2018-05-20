#! /usr/bin/python3

import sys
sys.path.append(sys.path[0] + "/data")

import shlex, subprocess, testdata, filecmp
from subprocess import Popen, PIPE
from testdata import ARG_LIST


PROG_CMD = "./build/rle "
TEST_PATH = "./data/"

PASSED_COUNT = 0
FAILED_COUNT = 0


# run program with arguments
def Run(args, expCode, testNum):
  global PROG_CMD
  print("Test #" + str(testNum) + " with parms '" + args + "'.")
  cmd = shlex.split(PROG_CMD + args)
  proc = subprocess.Popen(cmd, stdout=PIPE)
  proc.wait()
  code = proc.returncode
  result = proc.communicate()[0][0:-1].decode('ascii')
  print("RESULT: " + result)
  if (code == expCode):
    return 1
  else:
    return 0


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


def main():
  global ARG_LIST, PASSED_COUNT, FAILED_COUNT
  print()
  for i in range(0, len(ARG_LIST)):
    args = ARG_LIST[i][0]
    cmpFile = ARG_LIST[i][1]
    expCode = ARG_LIST[i][2]
    if (Run(args, expCode, i)):
      if (i % 2 != 0):
        if (CompareFiles("unpacked", cmpFile)):
          print("Test was passed successfully.\n")
          PASSED_COUNT += 1
        else:
          print("Test was failed.\n")
          FAILED_COUNT += 1
      else:
        PASSED_COUNT += 1
        print("Test was passed successfully.\n")
    else:
      print("Test was failed.\n")
      FAILED_COUNT +=1
  print("Passed tests: " + str(PASSED_COUNT))
  print("Failed tests: " + str(FAILED_COUNT) + "\n")
  return 0


main()
