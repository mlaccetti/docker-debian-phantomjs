# Debian PhantomJS Build using Docker

### Building

`$ docker build -t debian-phantomjs .`

### Running

`$ docker run --name my-phantomjs debian-phantomjs`

### Grabbing the binary

`$ docker cp debian-phantomjs:/usr/bin/phantomjs phantomjs` 