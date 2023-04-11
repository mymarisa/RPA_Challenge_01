# RPA_Challenge_01 + Robot framework
Practice automation (robot framework) with RPA Challenge

Instructions
1. The goal of this challenge is to create a workflow that will input data from a spreadsheet into the form fields on the screen.
2. Beware! The fields will change position on the screen after every submission throughout 10 rounds thus the workflow must correctly identify where each spreadsheet record must be typed every time.
3. The actual countdown of the challenge will begin once you click the Start button until then you may submit the form as many times as you wish without receiving penalties.
Good luck!

 # Requirements
* Python >= 2.7 | Python >= 3.3
* Robot Framework >= 3.0
* robotframework-seleniumlibrary
* Robotframework-excel Library
* xlutils 2.0.0. Access the downloads here, or use pip install xlutils.
  * xlrd that reads data from an Excel file

  
# Installation
The recommended installation tool is pip.

### Robotframework-excel Library 
Install pip. Enter the following :
```
pip install robotframework-excel
```
Enter the following (Append --upgrade to update both the library and all its dependencies to the latest version):
```
pip install robotframework-excel --upgrade
```
To install a specific version enter:
```
pip install robotframework-excel==(version)
```
Uninstall
To uninstall robotframework-excellibrary use the following pip command:
```
pip uninstall robotframework-excel
```
### xlutils (xlrd) Library 
Enter the following :
```
pip install xlrd
```
To install a specific version enter:
```
pip install xlrd==(version)
```
## Running the Demo
Run Robot Framework :
```
robot rpa_challenge_test.robot
```
