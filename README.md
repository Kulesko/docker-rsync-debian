# How to use
`docker build -t rsync-debian-slim .`
to build the image

then run via
`docker run -d -p 873:873 -v /home/USER_NAME/rsync_shared:/var/rsync_shared rsync-debian-slim:latest`
