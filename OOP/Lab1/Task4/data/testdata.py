#! /usr/bin/python3


# (arguments, cmp_file, expected_exit_code)
ARG_LIST = (
  ('pack input1 packed', '', 0),
  ('unpack packed unpacked', 'input1', 0),
  ('pack input2 packed', '', 0),
  ('unpack packed unpacked', 'input2', 0),
  ('pack input3 packed', '', 0),
  ('unpack packed unpacked', 'input3', 0),
  ('pack input4 packed', '', 5)
)
