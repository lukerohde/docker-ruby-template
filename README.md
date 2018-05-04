# docker-ruby-template


This project sets up a ruby development environment with a postgresql database.  Bundler and pgdata files live on the host.  Bundle install and migrating the database is left to docker runtime (via a script in app/start.docker) rather than at build time (which is a pain because everytime your gemfile changes it has to install all gems from scratch).  
    
NB on mac, docker's linked file shares are slow, particularly when testing.  I use docker-sync on mac which uses rsync to sync my dev file changes to a linked busy-box container has a longer life cycle than the www container.  TODO docker-sync instruction.

```
git clone git@github.com:union-software-cooperative/docker-ruby-template.git your-project-name
```

```
cd your-project-name
```

## Using docker
run containers
```
docker-compose up -d
```

You can run the following command to get into the ruby www container
```
docker-compose exec www /bin/bash
```

To debug
```
docker ps
docker attach your-container-id
```

## Using docker-compose shortcuts
typing docker-compose all the time can be tedious so add this to your ~/.bashrc or ~/.bash_profile

```
alias dc='docker-compose'
alias dce='docker-compose exec'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcr='docker-compose run'
alias dcs='docker-compose stop'
alias dcb='docker-compose build'
alias dcps='docker-compose ps'
alias dps='docker ps'
alias dk='docker kill $(docker ps -q)'
dceb() { docker-compose exec $1 /bin/bash ; }
```

## developing with docker on osx
Docker volume mounts to the host are suuupperrr slow. 

Use docker sync to get your source from the host to the container. 
```
cp docker-sync.yml.example docker-sync.yml
```

And mount your pgdata and bundle data on an external docker volume, so if you rebuild or remove your db or www containers you don't loose all your data and don't have to reinstall all your gems.

```
cp docker-compose.override.yml.example docker-compose.override.yml
```

start docker-sync (might need to `gem install docker-sync`???)
```
docker-sync start
```

Sometimes stuff can stop syncing from host to guest. Restarting stuff can help in this order 
1. docker-compose down www
2. docker-sync stop
3. restart docker for mac

## Setup git for your new project

unlink the docker-ruby-template repo
```
rm -rf .git
```

make a new repo on github

```
git init
git remote add origin your-git-repo
git add .
git commit -m "Initial commit."
git push origin master
```

