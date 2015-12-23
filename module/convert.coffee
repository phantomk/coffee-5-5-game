fs = require 'fs'
owls = fs.readFileSync 'OWL2.txt', 'utf8'
wordList = owls.match /^(\w+)/mg
fileConvert = """
  root = typeof export === "undefined" ? window : exports;
  root.OWL2 = ['#{wordList.join "',\n'"}']
"""
fs.writeFile 'OWL2.js', fileConvert
