#!/usr/bin/ruby

# bash_git_branch.rb - Script to show the current git branch in the bash PS1
# Rewritten in Ruby by Scott I. Latham (silatham99)
# v1.0.3 - 04/18/2014

BLACK = '\[\033[0;38m\]'
GREEN = '\[\033[0;32m\]'
RED = '\[\033[0;31m\]'
YELLOW = '\[\033[0;33m\]'
DEFAULT_PS1 = "#{YELLOW}"'\w '"#{BLACK}: "

def get_branch(git_query)
  words = git_query.split(/\s/)

  words.each_index do |index|
    branch_next = (words[index-1] == 'On' &&
                   words[index] == 'branch')
    return words[index+1] if branch_next
  end

end

def get_commit_color(git_query)
  status = false
  git_query.lines.each do |line|
    status ||= !!line.match(/\Anothing to commit, working directory clean\n\z/)
  end
  status ? GREEN : RED
end

begin
  git_query = %x(git status 2> /dev/null)
  raise StandardError.new if git_query.empty?

  puts "#{YELLOW}"'\w '"#{get_commit_color(git_query)}(#{get_branch(git_query)}) #{BLACK}: "

rescue
  puts DEFAULT_PS1
end