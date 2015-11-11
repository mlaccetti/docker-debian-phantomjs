###
# Building:
# $ docker build -t debian-phantomjs .
#
# Running:
# $ docker run --name my-phantomjs debian-phantomjs
#
# Grabbing the binary:
# $ docker cp debian-phantomjs:/usr/bin/phantomjs phantomjs 

FROM debian:jessie

# Update the container
RUN apt-get update

# Install build tools
RUN apt-get install -y wget curl unzip python perl build-essential flex bison gperf ruby 

# Install compilation dependencies
RUN apt-get install -y libicu-dev libfontconfig1-dev libjpeg-dev libfreetype6 libsqlite3-dev libssl-dev libpng-dev

# Download and extract PhantomJS
WORKDIR /root
RUN curl -LSO https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.0.0-source.zip
RUN unzip phantomjs-2.0.0-source.zip
RUN rm -f phantomjs-2.0.0-source.zip

# Build it
WORKDIR  /root/phantomjs-2.0.0
RUN ./build.sh --confirm --silent
RUN cp ./bin/phantomjs /usr/bin
RUN phantomjs -v

# And wrap up
CMD echo "phantomjs binary is located at /usr/bin/phantomjs" \
	&& echo "just run 'phantomjs' (version `phantomjs -v`)"