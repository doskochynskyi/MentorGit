echo "Text from dev script file"

echo $1

git config --global user.name Ivan
git config --global user.email ivan.doskochynskyi@gmail.com
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

#cd ./aksrepo

#git clone https://github.com/doskochynskyi/MentorAKS.git
echo "ls ./"
ls
echo "ls ./MentorAKS"
cd MentorAKS
ls 
#cat values-dev.yaml | sed  's/tag: "[a-zA-Z0-9]\{8\}"/tag: \"'$1'\"/' > new-values-dev.yaml
#mv  new-values-dev.yaml values-dev.yaml
#less values-dev.yaml
#git add .
#git commit -m "update tag"
#git push origin