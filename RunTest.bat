cd c:\data
RMDIR GitIssue /S /Q
git clone https://github.com/mariuszkochanowski/GitIssue.git
cd GitIssue
git fetch
git checkout "feature/branchname"