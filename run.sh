# Create the new directory
read -p "Enter the project name: " FULL_PATH_TO_PROJECT
while [ "$FULL_PATH_TO_PROJECT" = "" ]
do
    echo "The project name cannot be empty."
    read -p "Enter the project name: " FULL_PATH_TO_PROJECT
done

FULL_PATH_TO_PROJECT=$PWD/$FULL_PATH_TO_PROJECT
echo "Creating $FULL_PATH_TO_PROJECT directory ..."
mkdir $FULL_PATH_TO_PROJECT

cd $FULL_PATH_TO_PROJECT
git init
echo "Inited a git repository in $FULL_PATH_TO_PROJECT directory".
cd ..


# Get the JSFiddle id/version
read -p "Provide the JSFiddle id: " JSFIDDLE_ID
while [ "$JSFIDDLE_ID" = "" ]
do
    echo "The JSFiddle id cannot be empty"
    read -p "Provide the JSFiddle id: " JSFIDDLE_ID
done

 echo '{"fiddleVersion":0}' > config.json

# Run index.js
OUTPUT=""
while [ "$OUTPUT" = "" ]
do
    OUTPUT=`node index.js $JSFIDDLE_ID $FULL_PATH_TO_PROJECT`
    echo $OUTPUT
    cd $FULL_PATH_TO_PROJECT
    git diff | less
    git add .
    git commit
    cd ..
done
rm config.json
