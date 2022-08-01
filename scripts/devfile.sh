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

cat MentorAKS/values-dev.yaml | sed  's/tag: "[a-zA-Z0-9]\{8\}"/tag: \"'$1'\"/' > MentorAKS/new-values-dev.yaml
less MentorAKS/new-values-dev.yaml