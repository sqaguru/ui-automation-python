# Linkedin Automation using Robot Framework

- Initial Author : Mukund R. Pathade (pmukund1997@gmail.com)
- Development started on March 2022

## Test Suits
1. Login Test (logtest.robot)
    - This test logs in linkedin and verify if the profilename of user.
2. Search Test(searchtest.robot)
   - This test search connections.
3. Filter Test(filtertest.robot)
    - Ths test filters the search connections according to priority and locations.

## Before you run the test
goto common.resource file and in variables section add profilename, username and password values in as shown 
    
    ```
    ***Variables***
    ${profilename}  YourProfileName
    ${username}  Yourusername
    ${password}  Yourpassowrd

    ```
after that run this command to install all dependencies:

    ```
    pip install -r requirements.txt
    ```

## How to run the test
Here is example

```
cd  /test_suite
robot -d report logtest.robot

```
First you have to go to test_suite folder
and then the robot command will run the test suite.
logtest.robot is the name of the test suite.

***

**DO NOT RUN individual test cases run the whole files**
