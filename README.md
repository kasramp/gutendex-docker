# Gutendex-docker

Containerization of [Gutenindex](https://github.com/garethbjohnson/gutendex).

You can find Docker images on [Docker Hub](https://hub.docker.com/repository/docker/kasramp/gutendex/general)

Note that this Docker image does not run the `updatecatalog` that is
responsible for reacting and updating catalog as indexing all the books
take a very long time, depending on the database from a few minutes to a few hours.

To create and update a catalog follow the instruction in the Gutendex
[Installation Guide](https://github.com/garethbjohnson/gutendex/wiki/Installation-Guide#6-populate-the-database)
