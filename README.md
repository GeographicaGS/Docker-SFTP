Docker Image for a SFTP Server
==============================
This Docker image is based on the work of __Knut Ahlers__ (knut@ahlers.me, https://github.com/luzifer-docker/sftp-share). All credits to him. Just made some extra configurations.


What does this Docker image contains?
-------------------------------------
A very basic image with a single user SFTP server and data storage, intended to act as an entry point of data to other containers. For example, this is often deployed in tandem with [Docker-GeoServer](https://github.com/GeographicaGS/Docker-GeoServer) to allow users to log in with WinSCP and load data to the server to be later served with GeoServer. GeoServer just mounts the volume _/data_ from this container.


Versions
--------
Don't think this will change too much. Everything is installed from repos, so there's not much to say aside from the SSH configuration file:

- __2015-07-24:__ based on ubuntu:14.04, installed SSH from packages is __SSH-2.0-OpenSSH_6.6.1p1 Ubuntu-2ubuntu2__ as the time of this writing. The __sshd_config__ and SFTP user configuration allows only for SFTP access.


Guidelines for Creating New Docker Tags in this Repository
----------------------------------------------------------
Each Docker tag in this repository addresses changes in library versions bundled together. Follow this guidelines when creating new Docker tags for this repo:

- to create and maintain new Docker tags, make a GIT branch with a descriptive name. Each tag must match its branch in name. Do not use GIT tags to support Docker tags, for branches does exactly the same job and does it better in this case. Never destroy those branches and keep them open;

- the master branch should reflect the most updated README.md. This means that the master branch may not point to the most "advanced" branch in terms of library versions. But always refer to the master README.md for the most updated information;

- don't forget to document detailed information about the new GIT branch / Docker tag in the former section;

- don't forget to update the first line of this README.md warning about the README.md version to tell the user about the README.md being read.


Usage Pattern
-------------
The image creates two environmental variables, __USER__ and __PASS__, used to create the SFTP user. Keep in mind that values for this variables are kept and accessible by a __docker inspect__, so, for maximum security, modify the Dockerfile itself with the desired values, build the image, and modify the Dockerfile again.

Build the image directly from GitHub (this can take a while):

```Shell
git checkout tagbranch

docker build -t="geographica/sftp:2015-07-24" .
```

or pull it from Docker Hub:

```Shell
docker pull geographica/sftp:2015-07-24
```

To start the container interactively for testing purposes:

```Shell
docker run -ti -p 2022:22 -e USER=user -e PASS=pass --name whatever geographica/sftp:2015-07-24 /bin/bash
```

To launch it for production:

```Shell
docker run -d -p 22 -e USER=user -e PASS=pass --name whatever geographica/sftp:2015-07-24
```
