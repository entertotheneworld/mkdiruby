########### TEST ARGV INPUT
def check_if_user_gave_input
  abort("mkdir: missing input") if ARGV.empty?
  abort("mkdir: too much entry") if ARGV.length > 1
end


########### FOLDER
def folder_name
  return folder_name = ARGV.first
end

def create_folder(folder_name)
  Dir.mkdir(folder_name)
end


########### GEMFILE
def create_gemfile(folder_name)
  gemfile = File.open("./#{folder_name}/Gemfile", "w+")
  gems = ["source \"https://rubygems.org\"", "ruby '2.7.4'", "gem 'rubocop'", "gem 'rspec'", "gem 'pry'", "gem 'dotenv'"]
  gems.each {|gem| gemfile.puts(gem)}
  gemfile.close
end

def launch_gemfile(folder_name)
  system("cd #{folder_name} && bundle install")
end


########### GITHUB
def git_init(folder_name)
  system("cd #{folder_name} && git init")
end


########### RSPEC
def rspec_init(folder_name)
  system("cd #{folder_name} && rspec --init")
end


########### FOLDER LIB
def folder_lib(folder_name)
  system("cd #{folder_name} && mkdir lib")
end


########### .ENV
def env(folder_name)
  File.open("./#{folder_name}/.env", "w")
end


########### .GITIGNORE
def gitignore(folder_name)
  gitignore = File.open("./#{folder_name}/.gitignore", "w+")
  gitignore.puts(".env")
  gitignore.close
end


########### README
def readme(folder_name)
  readme = File.open("./#{folder_name}/README.md", "w")
  readme.puts("# NAME\n\n\n## 1. Download the source code\n```ruby\n$ git clone https://github.com/entertotheneworld/XXXXX\n$ cd XXXXX\n```\n\n\n## 2. Install Gem\n```ruby\n$ gem install bundler\n$ bundle install\n$ rspec --init\n```\nTo verify the installation you must have a Gemfile.lock file in the folder.\n⚠️ COMMON ERROR : Check that your version of ruby ​​matches the one saved in the gem file.\n\n\n## 3. Usage\n```ruby\n$ cd lib\n$ ruby app.rb\n```")
  readme.close
end


########### APP.RB
def app(folder_name)
  app = File.open("./#{folder_name}/app.rb", "w+")
  app.puts("require 'bundler'\nBundler.require\nrequire_relative 'lib/'")
  app.close
end


def perform
  # Test ARGV input
  check_if_user_gave_input

  # Create folder
  create_folder(folder_name)

  # Create Gemfile
  create_gemfile(folder_name)
  launch_gemfile(folder_name)

  # GitHub
  git_init(folder_name)

  # Rspec
  rspec_init(folder_name)

  # Lib
  folder_lib(folder_name)

  #.ENV
  env(folder_name)

  # .Gitignore
  gitignore(folder_name)

  # Readme    
  readme(folder_name)

  # App.rb
  app(folder_name)
end

perform