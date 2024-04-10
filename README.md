# mini_container
```
git clone https://github.com/2LJDC/mini_container

podman build -t mini-server .

podman kill mini-server; podman rm mini-server

podman run -dt --name mini-server -p 0.0.0.0:8000:8000 mini-server

podman exec -it mini-server bash
```
