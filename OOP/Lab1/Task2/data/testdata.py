#! /usr/bin/python3

# (arguments, expected_result, expected_exit_code)
ARG_LIST = (
  ('2 10 11111111', '255', 0), # bin to dec
  ('2 16 11111111', 'FF', 0), # bin to hex
  ('10 16 2147483647', '7FFFFFFF', 0), # dec MAXINT to hex
  ('10 16 -2147483647', '-7FFFFFFF', 0), # dec MAXINT to hex
  ('10 16 -2147483648', '-80000000', 0), # dec MININT to hex
  ('10 7 32767', '164350', 0), # dec to radix 7
  ('10 2 32767', '111111111111111', 0), # dec to bin
  ('13 6 100', '441', 0), # radix 13 to radix 6
  ('2 10 122', '', 4), # wrong number for a given radix
  ('10 2 12.2', '', 4), # wrong number for a given radix
  ('1 10 111', '', 2), # wrong source radix
  ('2 56 111', '', 3), # wrong dest radix
)
