#  puppet-agent-smtp-docker-builder

## Usage

- Clone this repo
- Build the container

```
make
```

- Compile the package

```
docker run -it --rm -v ~/:/dist --env PUPPET_VERSION=1.5.1-1.el6 medallia/centos-puppet-agent-smtp-docker-builder
docker run -it --rm -v ~/:/dist --env PUPPET_VERSION=1.5.1-1trusty medallia/ubuntu-puppet-agent-smtp-docker-builder
```

- packages

The packages will be available under home directory of user as above commands were executed.


## Available ENV variables
- `PUPPET_VERSION` : version of puppet-agent package to use. / OPTIONAL

## Limitation
