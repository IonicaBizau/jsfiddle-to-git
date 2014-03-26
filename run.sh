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
ls
