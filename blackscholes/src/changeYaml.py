import yaml
import sys

ind = sys.argv[1]

with open("input.yaml") as file:
    inputY = yaml.load(file)
    instSelect = inputY['compileOption']['instSelMethod'][0]['customInstselector']['options']
    newInd = ['-injecttoindex='+str(ind)]
    inputY['compileOption']['instSelMethod'][0]['customInstselector']['options'] = newInd

with open('input.yaml','w') as file2:
    docs = yaml.dump(inputY,file2)
with open("llfi.stat.prof.txt","r") as file:
    f = open("llfiIndices.txt",'a')
    x = file.readlines()
    y = x[2].split('=')
    y[1] = y[1].strip('\n')
    f.write(str(ind) + '----------' + y[1] + '\n')