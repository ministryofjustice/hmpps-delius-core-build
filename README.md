# hmpps-delius-core-build

Until the core code is available in GitHub any code for automating provision of Docker containers or EC2 instances can be committed here.

A set of docker images to be used for Delius core

 - oracle-base
   - Oracle OEL 7.5 This is basically clone of Oracles that will not require an Oracle support password and username to build upon.
 - oracle-jdk7
   - Image with Oracle JDK 7
 - oracle-openjdk7
   - Image with OpenJDK7

##Building the images

Requirements
 - python 2.7.x
 - virtualenv
 - pip
```bash
$ cd docker
$ virtualenv .venv
$ . .venv/bin/activate
$ pip install -r requirements.txt
```

To build/clone oracle linux
```bash
$ ./oracle-base/build.sh
## enter Oracle Support username
## enter Oracle Support password
```

To other Docker images
```bash
$ make build
```
