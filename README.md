# DependableSystemDesignProject

# To test benchmark python scripts such as the updated measure.py script that calculates the EDC rate:
[Download Parsec-3.0 Suite](https://parsec.cs.princeton.edu/download.htm)
Please download the parsec-3.0 suite and not the parsec-2.1 if deciding to download.


##After downloading the parsec suite:
###To compile the parsec benchmarks:
Navigate to the parsec-3.0 folder and run these commands.
run: > `parsecmgmt -a build -p swaptions -c gcc-serial`
run: > `parsecmgmt -a build -p blackscholes`

After running these commands navigate to `/DependableSystemDesignProject/blackscholes/src` and copy the src folder.  Replace the src folder in the blackscholes folder of the parsec-3.0 suite.  Then navigate to `/DependableSystemDesignProject/swaptions/src` and copy the src folder.  Replace the src folder in the swaptions folder of the parsec-3.0 suite.  

Blackscholes and Swaptions in the parsec-3.0 suite are located at `/parsec-3.0/pkgs/apps/`





##To run any python script:

run: > `python3 <script_name>.py`

##Machine learning model script
navigate to `/DependableSystemDesignProject/
