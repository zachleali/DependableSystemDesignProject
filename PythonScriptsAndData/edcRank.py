def rank(outLoop,inLoop,domLoop,dataWith):
    alpha = 4
    beta = 3
    gamma = 1
    micro = 2
    n = max((alpha*inLoop)+(beta*domLoop)+(gamma*dataWith),1)
    d = max(micro*outLoop,1)
    print(n/d)

"""
#blackscholes
print("RANKING FOR BLACKSCHOLES")
rank(1,1,0,1)
rank(3,0,0,1)
rank(3,0,0,1)
rank(3,0,0,1)
rank(0,0,0,1)
rank(0,0,0,1)
rank(1,0,0,0)
rank(1,0,0,0)
rank(1,0,0,0)
rank(0,0,0,1)
rank(0,0,0,1)
rank(0,0,0,1)
rank(0,0,0,1)
rank(0,0,0,1)
rank(0,0,0,1)
rank(0,0,0,1)
rank(0,0,0,1)
rank(1,0,0,6)
rank(1,0,0,6)
rank(1,0,0,6)
rank(1,0,0,6)
rank(2,0,0,1)
rank(2,0,0,1)
rank(2,0,0,1)
rank(2,0,0,1)
rank(2,0,0,1)
rank(2,0,0,0)
rank(1,0,0,1)
rank(1,0,0,1)
"""

#SWAPTION  Ranking using rank function.  Ranking for Swaptions is not shown
print("RANKING FOR SWAPTIONS")

f = open("blackscholesIndex.txt.txt",'r')
f2 = open("swaptionsIndex.txt.txt",'r')
f3 = open("totalIndex.txt.txt",'w')

f_lines = f.readlines()

f2_lines = f2.readlines()


for i in f_lines:
    i = i.strip('\n')
    f3.write(i + '\n')
for s in f2_lines:
    s = s.split(',')
   # print(s[1])
    s = s[1].strip('\n')
    s = s.strip('')
    print(s)
    
    f3.write(s + '\n')

f.close()
f2.close()
f3.close()





