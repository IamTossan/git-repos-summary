# git-repos-summary
A tool to display a summary of multiple git repos statuses

This tool is designed to display quickly the status
of multiple git repositories which should be helpful
to get a quick overview

usage:

	./git-summary.sh
		checks repos listed in repos.txt in the current directory
		if it exists or else
		checks repos under the current directory
    
	./git-summary.sh repodir1, repodir2, ...
		checks repos listed in arguments
