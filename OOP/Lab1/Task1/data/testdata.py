#! /usr/bin/python3

# 0 all fine
# 1 bad arguments count
# 2 bad arguments order
# 3 argument is not allowed
# 4 bad operation
	

# (arguments, result_file, expected_exit_code)
ARG_LIST = (
  ('input output "STRING" "REPLACE" "BAD"', '', 1), # few args
  ('notexist output "STRING" "REPLACE"', '', 2), # not exist input
  ('input output "" "REPLACE"', '', 4), # empty search string
  ('empty output "STRING" "REPLACE"', 'emptyRes', 0), # empty input file
  ('notfound output "STRING" "REPLACE"', 'notfoundRes', 0), # not found search string
  ('mama output "MA" "MAMA"', 'mamaRes', 0), # mama replace
  ('digit output "1231234" "REPLACE"', 'digitRes', 0), # 1231234 replace
  ('oneline output "STRING" "REPLACE"', 'onelineRes', 0), # one line
  ('longline output "STRING" "REPLACE"', 'longlineRes', 0), # long line
  ('manyline output "STRING" "REPLACE"', 'manylineRes', 0) # many line
);
