# echo "# cgra-opt" >> README.md

# git@github.com: Permission denied (publickey).
ssh-add ~/.keys/id_rsa
ssh -T git@github.com

# git init
git add .
git commit -m "add DSE.h and class ForNode to build a for-Node tree"
git branch -M main
git remote add origin git@github.com:segmentKOBE/cgra-opt.git
git push -u origin main




