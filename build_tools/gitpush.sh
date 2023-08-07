# echo "# cgra-opt" >> README.md

# git@github.com: Permission denied (publickey).
ssh-add ~/.keys/id_rsa
ssh -T git@github.com

# git init
git add .
git commit -m "keep writing lowering process for blockloadop"
git branch -M new
git remote add origin git@github.com:segmentKOBE/cgra-opt.git
git push -u origin new




