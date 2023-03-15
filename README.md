# README

This is a barebones [Django](https://www.djangoproject.com/) example deployed on [Aptible](https://aptible.com). The app in this repo is deployed live [here](https://app-52709.on-aptible.com/).

## Prerequisites

Please complete the following steps before moving forward:

- Install [Git](https://git-scm.com/downloads)
- Install the [Aptible CLI](https://deploy-docs.aptible.com/docs/cli)
- Add an [SSH public key](https://deploy-docs.aptible.com/docs/public-key-authentication) to your Aptible user account.

## Deployment

1. Clone or fork the [template-django repo](https://github.com/aptible/template-django)
2. Create an App, using the Dashboard, or the [`aptible apps:create`](https://deploy-docs.aptible.com/docs/cli-apps-create) command:

```shell
# Set or substitute $APP_HANDLE with the app name of your choice

aptible apps:create "$APP_HANDLE"
``` 
3. Once provisioned, copy the App's [Git Remote](https://deploy-docs.aptible.com/docs/git-remote) from the Dashboard or when it is returned in the CLI. The Remote will be referred to as `$GIT_REMOTE` moving forward.
4. Push the cloned repository to the Aptible Git Remote:

```shell
# Substitute $GIT_REMOTE with the copied Git Remote in step 3

git remote add aptible "$GIT_REMOTE"
git push aptible main
```
5. Create a default endpoint for the `CMD` service using the [aptible endpoints:https:create](https://deploy-docs.aptible.com/docs/cli-endpoints-https-create) CLI command:

```shell
# Substitute $APP_HANDLE with the app name

aptible endpoints:https:create \
        --app "$APP_HANDLE" \
        --default-domain \
        "CMD"
```

That's it! Your web service will be live on your Endpoint URL as soon as the build finishes.

## Optional Next steps:

1. Provision a [PostgreSQL](https://deploy-docs.aptible.com/docs/postgresql) [Database](https://deploy-docs.aptible.com/docs/databases) for your App using the Dashboard or via the [`aptible db:create`](https://deploy-docs.aptible.com/docs/cli-db-create)CLI command, substituting `$DB_HANDLE` with the database name of your choice: 

```shell
aptible db:create "$DB_HANDLE" --type postgresql
```

2. Copy the connection string returned by `aptible db:create` command on success. This is a [Database Credential](https://deploy-docs.aptible.com/docs/database-credentials) which is needed to configure your App. This connection string can also be accessed in the Dashboard by clicking on Reveal under Credentials in the database page.  Going forward in this document, we'll refer to the Credential as `$DATABASE_URL`.

3. Setup database migrations to run upon deploy to ensure your app code and database are in sync. You can tell Aptible to run your migrations by adding a [`.aptible.yml`](https://deploy-docs.aptible.com/docs/aptible-yml) file in your cloned repository. The file should be named `.aptible.yml`, and found at the root of your repository. Here is a sample `.aptible.yml` file to automate Database migrations:

```yaml
before_release:
  - python manage.py migrate
```

4. [Configure the App](https://deploy-docs.aptible.com/docs/configuration) to point it the newly provisioned Database by adding the required environment variable. Use the [`aptible config:set`](https://deploy-docs.aptible.com/docs/cli-config-set) command as documented below, substituting `$APP_HANDLE` and `$DATABASE_URL` with their proper values.

```shell
aptible config:set --app "$APP_HANDLE" \
    "DATABASE_URL=$DATABASE_URL"
```

This command will result in the app deploying again to reflect the updated configuration. 
