## Composing containers to build a sample web stack

__this is a work in progress for a blog post/presentation__

### Writting a simple web app in Ruby

Head to the `webapp/` directory, take a look around, you'll find a very basic Sinatra app.

This is how you'll make in run:
```
docker build -t webapp .
sudo docker run --name web1 webapp
```

### Serving with Nginx

Now that we've got an app running, we'll need a web server to control the traffic and server that app. Go now inside the `nginx/` directory.

And run the server:
```
docker build -t nginx .
sudo docker run -p 80:80 --link web1:webapp nginx
```


### Adding a database to the web app

Alright, now we might need to persist data inside a database. Go to `database/` and get a db running:

```
docker build -t postgresql .
docker run \
  -v /tmp/psql:/var/lib/postgresql \
  --name database postgresql
```
__TODO__

### Plug-in a backend to the web app

Let's add a backend linked to our app. Take a look at `backend/`

__TODO__

### Add an Message Passing software between backends

__TODO__
