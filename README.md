# Aeleus

## Simple application for adding new bash aliases on the fly.

### Installation

#### Crystal Build

If you don't have the Crystal language installed, please see [how to install Crystal](https://crystal-lang.org/reference/installation/).

```
$ git clone https://github.com/nucleogenesis/aeleus
$ cd aeleus
$ crystal build aeleus.cr
```

This will create a binary file called `aeleus`.

You can place this anywhere you'd like - but it would be best placed somewhere in your PATH. Usually, this is somewhere like `/usr/local/bin`. In any case, you want to have that `aeleus` binary in a place where you can call it from your console. If you want to make one last manual alias, you can add `alias aeleus="/path/to/aeleus"` to your .bashrc or .bash_aliases file.

#### Packaged Installations

_I may decide later on to create a package but it is relatively easy to build. I may also just have a built binary ready for download in the future._

### Usage

Aeleus is a simple program that lets you create new aliases quickly without having to open your .bashrc or .bash_aliases (or whatever file you use) to edit it.

Aeleus has the following flags:

```
-f FILE, --to=FILE               Exact full path to the file where you want aliases added. (eg, /home/user/.bashrc) DEFAULT=~/.bash_aliases
-a ALIAS, --alias=ALIAS          The alias name that you want to apply the command to.
-c COMMAND, --command=COMMAND    The command that you want to alias. If your command has spaces, put it between double-quotes. (eg, aelius -a sshproduction -x "ssh -i ~/.ssh/key user@domain")
```

#### Adding a new alias to ~/.bash_aliases
The default file is `~/.bash_aliases` - if it doesn't exist, Aeleus will create it. (_NOTE: If Aeleus creates the file, you may still have to ensure that it is loaded when you open your console_)

The following command:

`aeleus -a sshdev -c "ssh -i /path/to/keyfile user@dev-server.xyz"`

Will append:

`alias sshdev="ssh -i /path/to/keyfile user@dev-server.xyz"`

to the end of your `~/.bash_aliases` file.

**When your command has a space in it, you MUST put it in double quotes. If it doesn't have a space, the quotes are not required.**

#### Adding a new alias to another file (ie, ~/.bashrc)

`aeleus -f ~/.bashrc -a killngnix -c "systemctl stop nginx"` will add `alias killnginx="systemctl stop nginx"` to your ~/.bashrc.

*Note: You can have any file after the `-f` flag as long as you have permissions to access it.*