## doh-client

This runs doh-client (https://github.com/LinkTed/doh-client) as a dns client at port 53 for using DNS over HTTPS. By default the resulting container will use Cloudflare as resolver but you should be able to use any DoH supporting server. For a good list take a look [here](https://github.com/curl/curl/wiki/DNS-over-HTTPS).

### Running the container
#### Using defaults
```docker run --name doh-client --rm --net host flexo3001/doh-client```
