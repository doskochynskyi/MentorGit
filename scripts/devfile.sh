echo "Text from dev script file"

git config user.name Ivan
git config user.email ivan.doskochynskyi@gmail.com
#git commit -am "Config file copied from MentorTF module"
#git push

if [ ! -d "./aksrepo" ] 
then
    echo "Directory ./aksrepo does not exists." 
    mkdir ./aksrepo
    ls ./
else
    echo "Directory exists."
fi