echo "started"
git add .
echo "enter the commit message : "
read comment
git commit -m $comment
git push origin main
