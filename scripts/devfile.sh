echo "Text from dev script file"

echo $1

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

cd ./aksrepo

git clone https://github.com/doskochynskyi/MentorAKS.git
less MentorAKS/values-dev.yaml