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

