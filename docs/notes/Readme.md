# Notes

## Docker

### ARG/ENV trick

Use build-args as ENVs later in the container:  ``docker build --build-arg PG_MAJOR=10``

````
ARG PG_MAJOR
ENV PG_MAJOR=${PG_MAJOR:-11}
````

### ADD or COPY

- Always use `COPY` unless you know you need `ADD`
- `COPY` each file individually to enable best use of layers

### CMD

Provides defaultvalues for the `Entrypoint`:

````
CMD ["executable","param1","param2"]
````

- Could be a script too: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#entrypoint

## Bash

### $@

`$@` is a special variable that expands all passed arguments as strings. Can be used in Scripts to form parameters

````
#/usr/bin/env bash
echo $@
````

````
./script.sh one two three
# output: "one two three"
````

### exec

`exec` is a bash buit-in command that replaces the current shell with the parameter of exec.

````
#/usr/bin/env bash
exec echo "one"
echo "two"
````

````
./script.sh one two three
# output: "one"
````

`echo "two"` never runs because the script gets repaces by `echo one`, which exits after outputting "one".

Funfact: This can be used to use a script as `ENTRYPOINT` [inside a docker container](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#entrypoint).





