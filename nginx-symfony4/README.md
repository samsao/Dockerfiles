## Docker nginx-symfony4

`1.15`, `latest` ([Dockerfile](https://github.com/samsao/Dockerfiles/blob/develop/nginx-symfony4/Dockerfile))

## Source

The repository is on GitHub @ [samsao/Dockerfiles](https://github.com/samsao/Dockerfiles).

## Usage

This container can be used to deploy within a Docker stack the webserver part pre-configured to serve up a Symfony 4 application via PHP-FPM (running in another container in the same stack).

The Nginx server can be configured through various environment variables. We use [envplate](https://github.com/kreuzwerker/envplate) to enable variable substitutions. See the section below for more information about environment variables.

The Nginx is also configured for our specific needs. Mainly, it's for serving a Symfony4 API only service.

Also, one of the major constraints is that its expecting the SSL `.crt` file to be located at `/run/secrets/certificate.crt` and the `.key` file at `/run/secrets/certificate.key`. Those should be specified via Docker secrets ideally but can be mapped via volume directly also.

## Versionning

We follow the Nginx's Dockerfile versionning scheme. The base image we use is `alpine` variant.

## Environments

Available environment variables, default values and usage:

 * `server_host` (**Required**)

   The server host that will be serving the actual content.

 * `php_fpm_host` (**Required**)

   The host that is serving `PHP-FPM` via a socket for PHP processing.

 * `php_fpm_port` (**Required**)

   The port that is serving `PHP-FPM` via a socket for PHP processing.
