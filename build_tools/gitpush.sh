# echo "# cgra-opt" >> README.md

# git@github.com: Permission denied (publickey).
ssh-add ~/.keys/id_rsa
ssh -T git@github.com

# git init
git add .
git commit -m "update readme again"
git branch -M main
git remote add origin git@github.com:MIONkb/cgrv-opt.git
git push -u origin main




