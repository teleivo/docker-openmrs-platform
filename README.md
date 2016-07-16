<img src="https://cloud.githubusercontent.com/assets/668093/12567089/0ac42774-c372-11e5-97eb-00baf0fccc37.jpg" alt="OpenMRS"/>

# OpenMRS Platform Docker

> Docker containers for [OpenMRS](http://openmrs.org) Platform 2.0

This repository contains the necessary code to create Docker containers that start an instance
of the OpenMRS Platform 2.0.

For more information about the OpenMRS Platform visit [openmrs.org](http://www.openmrs.org/).

## Prerequisites

Make sure you have [Docker](https://docs.docker.com/) installed.

This Docker image cannot run without the correct database appropriate for the OpenMRS Platform 2.0 version used.

Fortunately there is a Docker image for it at [OpenMRS Platform MySQL](https://github.com/teleivo/docker-openmrs-platform-mysql)

You can use [Docker Compose](https://docs.docker.com/compose/install/) to install and wire these two images together.

Please check out the Docker Compose example in the `example` folder.

## Setup
You need to have the Docker image locally in order to run it.

You can either build it yourself or pull it from the :cloud:

Please follow the appropriate section below.

### Build
Start by cloning this repository:

```
git clone https://github.com/teleivo/docker-openmrs-platform.git
```

Enter the directory and build the image:

```
cd docker-openmrs-platform
docker build --tag openmrs-platform .
```

### Pull
The Docker image is hosted on [Docker Hub](https://hub.docker.com/r/teleivo/openmrs-platform/)

You can pull via
```
docker pull teleivo/openmrs-platform
```

### Run
Ensure you built or pulled the image first.

Since this image needs [OpenMRS Platform MySQL](https://github.com/teleivo/docker-openmrs-platform-mysql) to run please refer to the Docker Compose example in the `example` folder [example/README.md](README)

## License
[MPL 2.0 w/ HD](http://openmrs.org/license/) © [OpenMRS Inc.](http://www.openmrs.org/)
