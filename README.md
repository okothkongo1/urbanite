


## To contribute
Fork the this repo then clone from forked repo from your github account 

```git clone https://github.com/your_username/urbanite.git```  

or   
```git clone git@github.com:your_username/urbanite.git```

### Setting up environment

Our application is dependent on the following:

- ruby version 2.6.3

- rails v 6.0.2

- nodejs v 12 

- postgres

The installation varies depending on the enviroment/ OS this guide dwells majorly on debian based linux
distros.You can update it to including any missing OS.In the meantime it we will  always direct you to the documentation of the given dependency if we feel it is not well covered.

#### Ruby installation

Install ruby version manager (rvm) by following  [these instructions](https://rvm.io/)

If you are using ubuntu or  debian based linux distro follow [these instructions](https://github.com/rvm/ubuntu_rvm)

After installation of rvm   install to  ruby version-2.6.3 then type this on your terminal `rvm install 2.6.3`.

### Installing rails

Just run `gem install rails` for linux or unix

f you are on Windows follow [these instructions](https://rubyinstaller.org/downloads/)

#### Node js and  installation 

oO install nodejs in debian based distros  run these commands

`curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -`

`sudo apt install nodejs`

 For more  nodes visit their [docs](https://nodejs.org/en/)

Install yarn using this [link](https://classic.yarnpkg.com/en/docs/install/#debian-stable) Follow the instructions suitable for your OS

### Installing postgres

Our application use postgres at both development and production.On debian based linux more specifically ubuntu you can install postgres like so: 

`sudo apt-get install postgresql postgresql-contrib libpq-dev`
incase you  face problems concerning non-exist user follow this [guide](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04)

For more details on other distros or OS here is the [docs](https://www.postgresql.org/download/)



### Fetching deps and starting your server:

change your working directory  to *urbanite* `cd urbanite`

with working directory as `urbanite`

Now run `bundle` to get rails dependencies and `yarn install` to get  node dependencies

Run server like so: `rails s`

Now you can visit [`localhost:3000`](http://localhost:3000) from your browser.

### The actual contribution and Navigating the git 

Create a remote repo with name upstream, i.e 

```git remote add upstream https://github.com/okothkongo1/urbanite.git```

 or

`git remote add upstream git@github.com:okothkongo1/urbanite.git`

Before working on an issue, ensure your local repo is up-to-date, by running:

* Create a branch from develop like so: `git  checkout -b 3-updatecontribution-readme origin/develop`

* Ensure your work is upto date by pulling from upstream like so: ```git pull upstream develop```

When creating a branch, ensure it has an issue number.

For example, issue `3-update-contribution-readme` should be in the branch name:

`3-update-contribution-readme`




Upon making changesand before push 
ensure linting and tests are passing by running:

`rubocop` , `rspec` deal with failures which may arise

When all is done push to the `origin` remote (your forked repo) like so:

```git push origin branchname```

Your last commit message should be in the form `Update contribution readme#fixes3`

Then create a pull request if you feel the issue is completed
