# README

This is sample project for epidemic contact tracing. This was made during Hack
the Crisis Finland -hackathlon in March 2020.

Initial idea is for the users to input data where they have been, how many
people have come into close contact etc. Some baseline data can be easily added
by downloading existing Google Location history and uploading it to this
service. (Assuming user has Google Location history turned on and is preferably
using Android mobile phone.)

Further development would be to get GPS tracking data from other applications
(e.g. fitness trackers or other cellphone location tracking apps) and parse
visits from there. Also with large enough user base this could also alert users
whether you had crossed paths with infected persons.

Project details page:
https://app.hackjunction.com/projects/hack-the-crisis-finland/view/5e7511fa09429f0049bcd4ea

## Build instructions

You need to have:

- Ruby version ~>2.5.5 to build the project
- PostgreSQL >= 12

Testing

- Puma 

Create rails credentials

```bash
EDITOR=vim rails credentials:edit
```

When building the docker image for the first time and getting
`OpenSSL::Cipher::CipherError:` it may be trying to reference
the wrong `master.key`. Either know the production key or delete
and regenerate a new one
`rm config/credentials.yml.enc config/master.key; EDITOR=cat rails credentials:edit`

Add needed gems

```bash
sudo bundle install
```

Build and run the container

```bash
docker build . -t pisarasi
docker run pisarasi
```
