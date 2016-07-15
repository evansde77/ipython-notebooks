# ipython-notebooks


iPython Notebooks that I have used, messed with or generally want to share plus some utils for setting up and managing
notebooks in a git repo. 

## Tools

### new notebooks

Creating a new notebook complete with its own virtualenv can be done using the scripts/new-notebook.sh script. 
The script accepts up to three positional arguments, the first of which is required

1. name of notebook 
2. python interpreter - defaults to python2.7
3. requirements file - defaults to the requirements.txt in the top level of this repo

Usage Example:
```bash
./scripts/new-notebook.sh redis-example
```
This creates a new notebook directory in this repo's top level directory, creates a virtualenv and installs the requirements. It also creates a start.sh script in the new notebook dir to start up the server in its virtualenv, and commits the new directory to the repo. 

### Initial setup 
To assist with setting up a development environment for python on a completely new machine (MacOSX) the scripts/setup-python.sh contains example steps to install python 2 and 3 with pyenv, and set up virtualenv and pip for both of them. While the script should run, it is intended more as an advisory guide to setting up a working python environment on which to build python projects and notebook driven analyses. 


