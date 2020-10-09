#!/usr/bin/env python

import os
import sys
import json

filename = sys.argv[1]

with open('compile_commands.json') as f:
    data = json.load(f)
    for i in data:
        #currfile = os.path.abspath(i['directory'] + '/' + i['file'])
        currfile = i['file']
        if currfile == filename:
            #i['arguments'][-1] = currfile
            #i['arguments'][-2] = os.path.abspath(i['directory'] + '/' + i['arguments'][-2])
            #cmd = " ".join(i['arguments'])
            cmd = i['command']
            #print(cmd)
            os.chdir(i['directory'])
            ret = os.system(cmd)
            #if ret == 0:
            #    print("\033[92mCompile success.\033[0m")
            #else:
            #    print("\033[31mCompile failed.\033[0m")
            exit()
    #print("\033[31mCompile command not found.\033[0m")
