import os
import sys


curdir = os.path.dirname(os.path.realpath(__file__))
llfi_stat_output = curdir + "/llfi/llfi_stat_output"
edcInst = open("edcInstructions.txt",'a')
nonedcInst = open("nonedcInstrcutions.txt",'a')
edcINJ  = open("EDC_INJECTIONS.txt",'r')
nonedcINJ = open("NON_EDC_INJECTIONS.txt",'r')


edcLines = edcINJ.readlines()
nonedcLines = nonedcINJ.readlines()
edcINJ.close()
nonedcINJ.close()

for i in edcLines:
    f = open(llfi_stat_output + "/" + "llfi.stat.fi.injectedfaults" + i.strip('\n'),'r')
    l = f.readlines()
    edcInst.writelines(l)
    f.close()
edcInst.close()

for j in nonedcLines:
    f = open(llfi_stat_output + '/' + 'llfi.stat.fi.injectedfaults' + j.strip('\n'),'r')
    l = f.readlines()
    nonedcInst.writelines(l)
    f.close()
nonedcInst.close()






