# Setting Up RSpec

_[A video demonstration is
here.](https://www.youtube.com/watch?v=wHkVhq5R0_8&t=600s)_ **If you follow this
directly, make sure you create a new directory and run the commands in that
directory.**

_[Here is a workshop demonstration of the pairing
flow](https://youtu.be/uLbPGE6pRdc)_

<!-- OMITTED -->

Learn to set up a new RSpec project.

## Guidance

RSpec is a kind of programming tool called a test framework. It is written for
use with the programming language Ruby. We can use it to test that our systems
do what they are supposed to do. We can also use it to build our test-driving
practice.

To set up a new RSpec project:

```shell
# This assumes you have Ruby & RVM installed. If you don't, visit:
# https://rvm.io/ to install RVM.

# First, create a directory for your project
; mkdir your-project-directory
; cd your-project-directory

# Then, we're going to get you the latest Ruby
; rvm get stable
; rvm use ruby --latest --install --default

# Next, install bundler, which manages dependencies like RSpec
; gem install bundler

# Create a bundler project
; bundle init

# And add RSpec to your dependencies
; bundle add rspec

# Generate an RSpec template
; rspec --init

# Create a folder for your implementation code
; mkdir lib

# And create a repository for your changes
; git init .
; git add .
; git commit -m "Project setup"

# Then go and create a repository on github.com
# On the next screen after you have created the repository,
# follow the "Push an existing repository from the command line" section
# To push your project to your github repository
# It will look something like this...
; git remote add origin YOUR_REMOTE_ADDRESS
; git branch -M main
; git push -u origin main
```


# Then go and create a repository on github.com
# On the next screen after you have created the repository,
# follow the "Push an existing repository from the command line" section
# To push your project to your github repository
# It will look something like this...
; git remote add origin YOUR_REMOTE_ADDRESS
; git branch -M main
; git push -u origin main

# Setting up a Sinatra project

[A video demonstration is here.](https://www.youtube.com/watch?v=1j0PS6e0CZk).

Learn to setup a Ruby project using Sinatra.

## Initial setup

[First, setup a new Ruby + RSpec project.](https://github.com/makersacademy/golden-square/blob/main/pills/setting_up_an_rspec_project.md)

Then, follow the additional steps below.

```bash
# Add the sinatra library, the webrick gem, and rack-test
bundle add sinatra sinatra-contrib webrick rack-test

# Create the main application file
touch app.rb

# Create the app_spec.rb integration tests file
mkdir spec/integration
touch spec/integration/app_spec.rb

# Create the config.ru file
touch config.ru
```

## The `app.rb` file

When building Sinatra web applications, this file will contain the application class. Create an empty one for now, you will define _routes_ later inside it (and learn about what a _route_ is).

```ruby
require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end
end
```

## The `config.ru` file

We will later use the command `rackup` to "run" the web server. That command comes built-in with the `webrick` gem we installed earlier. By running it, our Sinatra application will run continuously in a terminal, waiting to receive HTTP requests, just like a "real" web server would.

To know how to run the Sinatra application class, it needs a few lines of configuration of the file `config.ru` — let's add this now.

```ruby
# file: config.ru
require './app'
run Application
```

You should now be able to run the app by using the `rackup` command, and get a similar output:

```
$ rackup

[2022-05-11 16:14:54] INFO  WEBrick 1.7.0
[2022-05-11 16:14:54] INFO  ruby 3.0.1 (2021-04-05) [x86_64-darwin20]
[2022-05-11 16:14:54] INFO  WEBrick::HTTPServer#start: pid=7377 port=9292
```

Now use your browser to visit `http://localhost:9292`. You should see the following page.

![](./sinatra-home.png)

