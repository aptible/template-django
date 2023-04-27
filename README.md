<br>
<img src="https://user-images.githubusercontent.com/4295811/226700092-ffbd0c01-dba1-4880-8b77-a4d26e6228f0.svg"  width="64">

# Django on Aptible

This is a barebones [Django](https://www.djangoproject.com/) example deployed on [Aptible](https://aptible.com). The app in this repo is deployed live [here](https://app-52709.on-aptible.com/).

[Deploy on Aptible](https://app.aptible.com/create)

## Configuration

The only thing the user needs to do is create and set `SECRET_KEY` environment
variable during onboarding flow.

```bash
python3 -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())'
```

If you already created the app and just want to apply an environment variable,
you can use our [cli tool](https://www.aptible.com/docs/cli):

```bash
aptible config:set --app "$APP_HANDLE" SECRET_KEY="xxx"
```
