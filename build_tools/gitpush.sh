# echo "# cgra-opt" >> README.md

# git@github.com: Permission denied (publickey).
ssh-add ~/.keys/id_rsa
ssh -T git@github.com

# git init
git add .
git commit -m "TODO: modify llvm.func to a declare."
git branch -M main
git remote add origin git@github.com:segmentKOBE/cgra-opt.git
git push -u origin main




