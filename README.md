# Customize OpenShift Login Screen with USG Banner

This repo contains code to customize OpenShift's Login pages with the United
States Government (USG) consent banner required on USG owned information
systems.

[Reference](https://www.stigviewer.com/stig/red_hat_enterprise_linux_7/2017-12-14/finding/V-72225).

## Screenshots

### Login

![Login page screenshot](screenshot/login.png)

### Providers

![Providers page screenshot](screenshot/providers.png)

### Error

![Error page screenshot](screenshot/error.png)

## How to Deploy

Log in to the OpenShift cluster on the command line with `oc`. Then run,

```bash
./deploy.sh
```

## How to Delete

Log in to the OpenShift cluster on the command line with `oc`. Then run,

```bash
./delete.sh
```
