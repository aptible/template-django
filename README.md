# README

This is a barebones [Django](https://www.djangoproject.com/) example that can be deployed on [Aptible](https://aptible.com).

The app in this repo is deployed at [https://app-52709.on-aptible.com/](https://app-52709.on-aptible.com/).

## Deployment

See *INSERT LINK TO DJANGO QUICKSTART* or follow the steps below:

1. Clone or fork the repository.
2. Create an App on Aptible with `aptible apps:create $APP_HANDLE` 
3. Push this repository to the Aptible [Git Remote](https://deploy-docs.aptible.com/docs/git-remote)
4. Create a default endpoint for the `CMD` service.

That's it! Your web service will be live on your Endpoint URL as soon as the build finishes.
