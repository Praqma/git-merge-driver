# This script will run a quick demo of the merge driver.
# It will cause a merge conflict in a 'my-file.mrg' file.
# -------------------------------------------------------

# Run the mergetool-setup.sh script to configure the merge driver
./mergetool-setup.sh

# Add the my-merge-tool.sh to PATH
PATH=$PATH:`pwd`

# Clean up any previous example runs
git checkout master
git branch -D demo-branch-1
git branch -D demo-branch-2

# Create 'my-file.mrg' on branch 1
git checkout -b demo-branch-1
echo "created on: demo-branch-1" > my-file.mrg
git add my-file.mrg
git commit -m"demo-branch-1: added my-file.mrg"

# Create 'my-file.mrg' on branch 2
git checkout master
git checkout -b demo-branch-2
echo "created on: demo-branch-2" > my-file.mrg
git add my-file.mrg
git commit -m"demo-branch-2: added my-file.mrg"

# Merge the two branches, causing a conflict
git merge -m"Merged in demo-branch-1" demo-branch-1
