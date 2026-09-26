# Fetch all git remotes every 15 minutes
*/15 * * * * find ~/projects -maxdepth 3 -name .git -type d -exec sh -c 'cd "{}"/.. && git fetch --quiet' \;
