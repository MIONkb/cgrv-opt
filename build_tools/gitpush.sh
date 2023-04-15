# echo "# cgra-opt" >> README.md
# git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:segmentKOBE/cgra-opt.git
git push -u origin main



# git@github.com: Permission denied (publickey).
ssh-add ~/.keys/id_rsa
ssh -T git@github.com
