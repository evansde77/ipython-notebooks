#!/bin/bash
#
# set up a new notebook virtualenv
#

function usage() {
  echo ""
  echo "Usage: new-notebook.sh <notebook name> <python> <requirements file>"
  echo "notebook name - name of notebook to create in repo "
  echo "python - python version to use, defaults to python2.7"
  echo "requirements file - path to a requirements file to install "
  echo "   defaults to requirements.txt in this package"
  echo ""
}


REPO_DIR=`git rev-parse --show-toplevel`
DEFAULT_REQS="${REPO_DIR}/requirements.txt"
NOTEBOOK_NAME=$1
PYTHON_VERSION=$2
REQS=$3

if [[ "x${NOTEBOOK_NAME}" = "x"  ]]; then
    usage
    exit 1
fi

if [[ "x${REQS}" = "x"  ]]; then
    REQS=${DEFAULT_REQS}
fi

if [[ "x$PYTHON_VERSION" = "x" ]]; then
    PYTHON_VERSION="python2.7"
fi

NOTEBOOK_PATH="${REPO_DIR}/${NOTEBOOK_NAME}"
VENV_PATH="${NOTEBOOK_PATH}/venv"

mkdir $NOTEBOOK_PATH
virtualenv -p $PYTHON_VERSION $VENV_PATH
. $VENV_PATH/bin/activate
pip install pyzmq --install-option="--zmq=bundled"
pip install -r ${REQS}

START_SCRIPT="${NOTEBOOK_PATH}/start.sh"
GITIGNORE_SCRIPT="${NOTEBOOK_PATH}/.gitignore"

echo "venv" >> $GITIGNORE_SCRIPT
echo "#!/bin/bash" >> $START_SCRIPT
echo ". $VENV_PATH/bin/activate" >> $START_SCRIPT
echo "jupyter notebook --notebook-dir=${NOTEBOOK_PATH}" >> $START_SCRIPT
chmod +x $START_SCRIPT

git add $START_SCRIPT
git add $GITIGNORE_SCRIPT
#git commit -m "add new python notebook ${NOTEBOOK_NAME}"

echo "new virtualenv is setup in ${NOTEBOOK_PATH}"
echo "start it with"
echo "${NOTEBOOK_NAME}/start.sh"

