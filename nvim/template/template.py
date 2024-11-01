#!/usr/bin/env python3.8
# Created: <+DATE+> by <+AUTHOR+>

def main():
  import tafsm.argparse as argparse
  parser = argparse.ArgumentParser(description="""\
<+CURSOR+>
""")
  parser.add_argument("file", metavar="input-file", help="input file")
  parser.add_argument("-o", "--output", metavar="output-file", default="output", help="output file")
  parser.add_argument("-i", "--input", type=int, default=1, help="input data")
  parser.add_argument("-m", "--multiple", type=float, nargs='*', default=[1,2], help="input data")
  options = parser.parse_args()
  import os
  import numpy


if(__name__ == '__main__'):
  main()
