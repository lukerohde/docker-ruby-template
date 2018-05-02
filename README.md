# docker-ruby-template


```
git clone git@github.com:union-software-cooperative/docker-ruby-template.git .
```

```
git init
```

```
git remote add your-repo
```

```
rm -rf .git
```

run containers
```
docker-compose up -d
```

get into the web container
```
docker-compose exec www /bin/bash
```

NB on mac, linked file shares are slow particularly when testing, TODO provide docker-sync example
