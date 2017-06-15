## Basically fetch the tar file as specified on the URL and unpack
INFO='\033[1;37m'
ERROR='\033[0;31m'
SUCCESS='\033[0;32m'
WARNING='\033[0;33m'
NC='\033[0m' # No Color

function printDate() {
    printf "$(date +%Y/%m/%d-%H:%M:%S): $1\n"
}

function printError() {
    printDate "${ERROR}Error: $1${NC}"
}

function printWarning() {
    printDate "${WARNING}Warning: $1${NC}"
}

function printSuccess() {
    printDate "${SUCCESS}Success: $1${NC}"
}

function printInfo() {
    printDate "${INFO}Info: $1${NC}"
}

if [ -z "${SQL_URL}" ]; then
    printWarning "No dump file URL specified.... Exiting"
    exit 1
fi

## Fetch the URL specified

cd $MYSQL_STORE
FILE_TO_FETCH=${SQL_URL}
RAW_FILENAME=${FILE_TO_FETCH##*/}
FILENAME=${RAW_FILENAME%%\?*}
printInfo "Attempting to download ${FILE_TO_FETCH}"
curl -O $FILE_TO_FETCH 
if [ $? -eq 0 ]; then
    printSuccess "Successfully downloaded the file ${FILENAME}"
else
    printError "Failed to download the file ${FILENAME}"
    exit 1
fi

## Decompress the file
printInfo "Attempting to decompress ${FILENAME}"
tar xvzf $FILENAME
if [ $? -eq 0 ]; then
    printSuccess "Successfully decompressed file ${FILENAME}"
else
    printError "Failed to decompress the file ${FILENAME}"
    exit 1
fi

## Now clean up
printInfo "Removing original file - ${FILENAME}"
rm $FILENAME
if [ $? -eq 0 ]; then
    printSuccess "Successfully removed file ${FILENAME}"
else
    printError "Failed to remove the file ${FILENAME}"
    exit 1
fi

COUNT="$(ls -1 | grep *.sql | wc -l)"
printSuccess "Found ${COUNT} SQL files"
