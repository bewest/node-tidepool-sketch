

### getting started

```bash
$ npm install
# installs all tidepool servers in ./node\_modules
```

This installs all servers from the master branch into your local
`./node\_modules` directory.

This will allow you to test installing all the servers from scratch,
eg if you delete the directory you can start from scratch.

There are a substantial amount of dependencies across the daemons; due
to the early stage in development, we iterating and experimenting with
whatever gets the job done the fastest, within the confines of our
development policies.

The first `npm install` will take some time to complete downloading
and fetching and installing everything into this directory.

#### Experimenting with local changes

This package is designed to provide a central push-button type of
control for people who are familiar with tools such as `npm`,
`heroku`, and `git`.

NPM has a useful feature allowing users to install a symlink as a
package.

If you want to preview the entire environment with changes to one of
the services, the recommended approach is to make that service's repo
a sibling directory of this one, like this:
```
tidepool/
├── armada
├── blip
├── hakken
├── jellyfish
├── message-api
├── mmcsv-carelink-data
├── node-tidepool-sketch
├── sandcastle
├── seagull
├── styx
└── user-api
```


##### Cloning all repos

If you want to automate the process of arranging your git repos in
this manner, try something like this:

```bash
# create local clones as siblings of current directory
$ ./bin/clone-all.sh
```

You might already have a bunch of clones already, and just missing a
few.  If that's the case, `./bin/clone-sibling styx` will install styx
as a sibling from the current working directory.

**You need to run `npm install`** on your local projects.

##### Managing local changes

After your local projects are cloned and installed, you might want to
use changes in local development with the other services.  The `npm
link` command needs to be run once in your other project's directory,
and once in this directory in order for the system to use your
changes.

###### Link one project
Use
```bash
./git-npm-sibling-link my-project
```
This would link sibling directory, `my-project` in both places.

###### Link all projects
If you have clones of everything, have run `npm install` everywhere
already and want to link all of them, use:
```bash
./bin/link-all.sh
```

#### Using the system
After linking stringing together your `npm` dependencies for the
system as a whole into `node\_modules`, we can use standard tools
familiar to people using `heroku` or other similar systems.

A `Procfile` lists all the services that should be run to compose the
system.

Typing `./bin/start.sh` will set up a common environment, and use
`nodemon` and `node-foreman` to interpret the `Procfile` and monitor
your services for any changes.  Any time you change your local
sources, the system will restart so you can see what effect it might
have on a running system.

Each service has it's own script to start itself in
`./bin/<service-name>.sh`.  In open source fashion, each service has
some reasonable defaults for local development and experimentation
only, in `./etc/<service-name>.env`.  The format is simple shell
syntax, enumerating the environment variables.

This configuration is not fit for any purpose.  The intended use of
this code is solely to experiment with local changes in the
development of a system composed of these daemons.

Some daemons were not designed to be used as npm modules.
As a result, some daemons require being installed and `npm link`'d
locally in order for things to run correctly.  If that bothers you,
contact the authors of those daemons, not the authors of this repo.

