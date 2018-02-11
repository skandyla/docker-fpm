Docker-fpm
============

[![Build Status](https://travis-ci.org/skandyla/docker-fpm.svg?branch=master)](https://travis-ci.org/skandyla/docker-fpm)  
[![](https://images.microbadger.com/badges/image/skandyla/fpm.svg)](https://microbadger.com/images/skandyla/fpm "Get your own image badge on microbadger.com")  

## Summary

A docker image with **[FPM](https://github.com/jordansissel/fpm)** - Effing package management tool based on **[Debian](https://hub.docker.com/_/debian/)** Linux.  
Build packages for multiple platforms (deb, rpm, etc) with great ease and sanity.  

Repository name in Docker Hub: **[skandyla/fpm](https://hub.docker.com/r/skandyla/fpm/)**  
Published via **automated build** mechanism  


## Docker image usage

### Pull and tag (optional)
```
docker pull skandyla/fpm
```

### Build on your own (optional)
```
docker build -t fpm .
```

## FPM usage
[fpm/wiki#usage](https://github.com/jordansissel/fpm/wiki#usage)  

## How to package files with fpm and docker-fpm image
Let's assume we want to package libvirt_exporter, which consist from two files, and they should be placed to:
```
/etc/systemd/system/multi-user.target.wants/libvirt-exporter.service
/usr/local/bin/libvirt_exporter
```

So create temporary directory first:
`$mkdir rpmbuild`

Copy files to the rpmbuild directory assume it as a root path:
```
$tree rpmbuild/
rpmbuild/
├── etc
│   └── systemd
│       └── system
│           └── multi-user.target.wants
│               └── libvirt-exporter.service
└── usr
    └── local
        └── bin
            └── libvirt_exporter
```

Build rpm package:
```
$docker run --rm -v $(pwd):/data skandyla/fpm -s dir -t rpm -n "libvirt_exporter" -v 0.1 -p /data -C /data/rpmbuild ./
```

Example output:
```
{:timestamp=>"2018-02-11T13:46:37.459656+0000", :message=>"Created package", :path=>"/data/libvirt_exporter-0.1-1.x86_64.rpm"}
```

Verify package contents:
```
$rpm -qlp libvirt_exporter-0.1-1.x86_64.rpm
/etc/systemd/system/multi-user.target.wants/libvirt-exporter.service
/usr/local/bin/libvirt_exporter
```

## License
MIT
