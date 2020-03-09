## doh-client

This runs doh-client (https://github.com/LinkTed/doh-client) as a dns over https client at port 53. By default the resulting container will use Cloudflare as resolver but you should be able to use any DoH supporting server. For a good list take a look [here](https://github.com/curl/curl/wiki/DNS-over-HTTPS).

### Running the container
#### Using defaults
```docker run --name doh-client --rm -p 53:53 flexo3001/doh-client```

The default options are (which you can override with -e option):

```
LISTEN_ADDR "127.0.0.1:53"
REMOTE_ADDR "1.1.1.1:443"
DOMAIN "cloudflare-dns.com"
PATH "dns-query"
```
