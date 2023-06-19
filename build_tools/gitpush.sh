# echo "# cgra-opt" >> README.md

# git@github.com: Permission denied (publickey).
ssh-add ~/.keys/id_rsa
ssh -T git@github.com

# git init
git add .
git commit -m "llvm func of kernel is implemented to a declare and all unrolling design point is found in dse."
git branch -M main
git remote add origin git@github.com:segmentKOBE/cgra-opt.git
git push -u origin main




