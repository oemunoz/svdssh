# SupervisorD SDV SSH

This container is for setup a ssh port, with rsync and sudo.

## Installation
Pull the image.

```
docker pull oems/svdssh
```

## Usage
Setup the SVDUSER and SVDGROUP like on the example file (env-file) and add a file authorized_keys with your own id_rsa.pub (the same for the root and the user):

note: View the setup.sh for clarity.

```
# User and group
SVDUSER=myuser
SVDGROUP=mygroup

# If you setup this var to any, the sshd gonna to use the default key, this may be unsecure.
#DEFKEY="any"
```
and run the command:

```
docker run --rm -it --env-file ./env-file  -v $(pwd)/authorized_keys:/root/.ssh/authorized_keys oems/svdssh
```

or setup all the vars on the line command, for ie:
```
--env SVDUSER="myuser"
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

TODO: Write history

## Credits

TODO: Write credits

## License

TODO: Write license
