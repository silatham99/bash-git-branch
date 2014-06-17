# bash_git_branch.rb

Script to include the current git branch in your bash prompt
Based on a common bash script found on the internet

## Install:

* cd into the directory where bash_git_branch.rb resides and run:

```bash
    cp bash_git_branch.rb ~/.bash_git_branch && chmod 700 ~/.bash_git_branch
```
* Add these lines to your bash profile file (~/.bash_profile):

```bash
    function run_bash_git_branch {
      export PS1=$(~/.bash_git_branch)
    }

    PROMPT_COMMAND=run_bash_git_branch
```

* Restart bash and you should see the changes!