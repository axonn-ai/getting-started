#!/bin/bash
#
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

WRKSPC=$SCRATCH
# everything will be installed in $WRKSPC

ENV_NAME="axonn_venv"
# this is the name of your python venv, change if needed

cd $WRKSPC
echo -e "${RED}Creating Python Environment in $WRKSPC:${GREEN}"
module load pytorch 
# note: there are several pytorch modules on perlmutter
# this command loads the default one
# if you want to checkout other versions of the pytorch module:
# module avail pytorch

python -m venv $WRKSPC/$ENV_NAME --system-site-packages
# the --system-site-packages flag ensures that your python venv
# can use the system pytorch.


echo -e "${RED}Your Python Environment is ready. To activate it run the following commands in the SAME order:${NC}"
echo -e "${GREEN}module load pytorch${NC}"
echo -e "${GREEN}source $WRKSPC/$ENV_NAME/bin/activate${NC}"
echo ""

echo -e "${RED}Installing AxoNN:${GREEN}"
#Step 1 - activate your venv
source $WRKSPC/$ENV_NAME/bin/activate
#Step 2 - install axonn from source
git clone git@github.com:axonn-ai/axonn.git
cd axonn
pip install -e .

echo -e "${NC}"
