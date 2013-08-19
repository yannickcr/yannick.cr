---
layout: post
title: Installing nginx 1.4.0 with SPDY support
date: 2013-05-03 21:00
ignored: false
---

Since the version 1.4.0 [nginx](http://nginx.org) supports the [draft 2 of SPDY protocol](http://www.chromium.org/spdy/spdy-protocol/spdy-protocol-draft2).

But this SPDY module is not enabled by default and to enable it you need to entirely recompile nginx.

Here's a simple guide to do that.

Fist, be sure to have all needed packages (It can vary depending of your system, for information I'm doing this installation on Ubuntu 12.10)

```bash
sudo apt-get update
sudo apt-get install make gcc libpcre3-dev libssl-dev
```

Then download the source code of the last stable version of nginx on their repository: http://hg.nginx.org/nginx/tags

Currently the last stable version is the 1.4.0 (revision 7809529022b8);

```bash
wget http://hg.nginx.org/nginx/archive/7809529022b8.tar.gz
```

Decompress it:

```bash
tar -xzf 7809529022b8.tar.gz
cd nginx-7809529022b8
```

Launch the `configure` command:

```bash
./auto/configure --prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --http-client-body-temp-path=/var/cache/nginx/client_temp --http-proxy-temp-path=/var/cache/nginx/proxy_temp --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp --http-scgi-temp-path=/var/cache/nginx/scgi_temp --user=nginx --group=nginx --with-http_ssl_module --with-http_realip_module --with-http_addition_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module --with-http_stub_status_module --with-mail --with-mail_ssl_module --with-file-aio --with-ipv6 --with-http_spdy_module
```

(See the `--with-http_spdy_module` parameter at the end of the command)

(If you already have nginx installed and want to know with which parameters it was compiled you can run the command `nginx -V`)

Then if everything works fine, launch `make` and `make install`:

```bash
make
sudo make install
```

Update your nginx configuration file

```nginx
server {
  listen 443 ssl spdy;

  ssl_certificate mycertificate.crt;
  ssl_certificate_key mycertificate.key;

  # ... my server configuration ...

}
```

Finally, (re)start nginx

```bash
sudo service nginx restart
```

And voilà! Your website should now run with SPDY.