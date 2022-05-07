import os
import sys
import filecmp

print("\nBegin\n")


def findEDC(file1,file2):
    f1 = open(file1,'r')
    f2 = open(file2,'r')
    #f3 = open("edcValues.txt","a")
    bigDif = 0
    for l1 in f1:
        for l2 in f2:
            if l1 != l2:
                value1 = float(l1)
                value2 = float(l2)
                if (abs(value1 - value2) > 0.300000000):
                  #  f3.write("Golden: " + str(value2) + " " + "EDC: " + str(value1) + " " + "Difference: " + str(abs(value1-value2)) + "\n")
                    bigDif = 1
            break
    f1.close()
    f2.close()
    #f3.close()
    if bigDif == 1:
        return 1
    else:
        return 0

# set directory variables
curdir = os.path.dirname(os.path.realpath(__file__))
std_output = curdir + "/llfi/std_output"
baseline = curdir + "/llfi/baseline"
errdir = curdir + "/llfi/error_output"

# read golden output from ./baseline/golden_std_output
print ("Reading golden output...")
file_gld_out = baseline + "/golden_std_output"
print ("Complete.\n")

# read filenames from ./std_output
print ("Reading filenames...")
path, dirs, files = os.walk(std_output).__next__()
run_count = len(files)
print ("Complete. " + str(run_count) + " fault injection runs were performed\n")

# check for SDCs
sdc_count = 0
benign_count = 0
crash_count = 0
hang_count = 0
edc_count = 0
non_edc_count = 0
print ("Checking files...")
#EDCout = open("EDC_INJECTIONS.txt",'w')
#nonEDCout = open("NON_EDC_INJECTIONS.txt",'w')
for f in range(0, run_count):
    print ("Checking fault injection run " + str(f) + "...", end="\r")
    file_out = std_output + "/std_outputfile-run-0-" + str(f)
    try:
        file_err = open(errdir + "/errorfile-run-0-" + str(f))
        error_msg = file_err.read()
        file_err.close()
    except FileNotFoundError:   # no error output
        error_msg = ""
    if ("hang" in error_msg):
        hang_count += 1
    elif ("crash" in error_msg):
        crash_count += 1
    elif filecmp.cmp(file_out, file_gld_out):
        benign_count += 1
    else:
        
        edc = findEDC(file_out,file_gld_out)
        if edc == 1:
            #EDCout.write(".0-" + str(f) + '.txt' + '\n')
            edc_count += 1
        else:
            #nonEDCout.write(".0-" + str(f) + '.txt' + '\n')
            non_edc_count += 1
        sdc_count += 1
#EDCout.close()
#nonEDCout.close()
sys.stdout.write("\033[K")
print ("Complete.", end="\r")

"""
edcCount = open("EDCcount.txt","a")
nonEDCcount = open("nonEDCcount.txt","a")
totalFIruns = open("totalFIruns.txt","a")
sdcCount = open("SDCcount.txt","a")
#crashCount = open("crashCount.txt","a")
#benign = open("benignCount.txt","a")

edcCount.write(str(edc_count) + '\n')
nonEDCcount.write(str(non_edc_count) + '\n')
totalFIruns.write(str(run_count) + '\n')
sdcCount.write(str(sdc_count) + '\n')
crashCount.write(str(crash_count) + '\n')
benign.write(str(benign_count) + '\n')


edcCount.close()
nonEDCcount.close()
totalFIruns.close()
sdcCount.close()
crashCount.close()
benign.close()

"""

# print results
print ("\n")
print ("SDC count         = " + str(sdc_count))
print ("EDC count         = " + str(edc_count))
print ("Non-EDC count     = " + str(non_edc_count))
print ("Crash count       = " + str(crash_count))
print ("Benign count      = " + str(benign_count))
print ("Hang count        = " + str(hang_count))
print ("Total Fi runs     = " + str(run_count)) 

# print results to file
par_dir = os.path.split( os.path.abspath(os.path.join(os.path.dirname( __file__ ), os.pardir)))[1]
out = open(curdir + "/results.txt", 'w')
sys.stdout = out
print ("SDC count         = " + str(sdc_count))
print ("EDC count         = " + str(edc_count))
print ("Non-EDC count     = " + str(non_edc_count))
print ("Crash count       = " + str(crash_count))
print ("Benign count      = " + str(benign_count))
print ("Hang count        = " + str(hang_count))
print ("Total Fi runs     = " + str(run_count)) 
print ("SDC %             = " + str((sdc_count/run_count)*100))
print ("EDC %             = " + str((edc_count/run_count)*100))
print ("Non-EDC %         = " + str((non_edc_count/run_count)*100))
print ("Crash %           = " + str((crash_count/run_count)*100))
print ("Benign %          = " + str((benign_count/run_count)*100))
out.close()






