---
maintainer: praqma-thi
---

# git-merge-driver

This repository explains how to configure a custom merge driver in Git, allowing a custom tool to be run whenever certain files are caught in a merge conflict.

## Demo

Run `example.sh` for a demonstration of the merge driver.
It will create a merge conflict in the repository, causing the merge driver to start and resolve the conflict.

## Documentation

### git config

First up is defining the merge driver.
This is done in the `.git/config` file:

```
[merge "my-custom-driver"]
	name = A custom merge driver used to resolve conflicts in certain files
	driver = my-merge-tool.sh %O %A %B
```

The `merge` block contains the merge driver's identifier, used to reference the merge driver later.

The `name` property contains a description of the merge driver.

The `driver` property contains the command that will be called when a conflict occurs.
A handful of predefined parameters, most notably:
 - `%O`: ancestor’s version of the conflicting file
 - `%A`: current version of the conflicting file
 - `%B`: other branches' version of the conflicting file


For more, visit [git-scm.com - Git Attributes](https://git-scm.com/docs/gitattributes).

#### Distribution

Note that, much like git hooks, the `.git/config` file can't be checked in/shared through the repository.
A common way of distributing merge drivers is to check the configuration file in elsewhere and provide a script to copy it to `.git/config`.
In this repository, the merge driver is configured in the `.gitconfig` file, which is copied to `.git/config` by the `mergetool-setup.sh` script.

### merge driver

For a successful merge, the merge driver is expected to leave the merge result at `%A`'s path and exiting with status code `0`.

If the merge went awry, the merge driver can exit with a non-zero status code.

_Note_: Any tools or scripts called by the merge driver must be available on `PATH`.

### git attributes

You configure the file patterns you want the merge driver to be used for in the `.gitattributes` file:

```
*.mrg merge=my-custom-driver
```

### Resources

- [git-scm.com - Git Attributes](https://git-scm.com/docs/gitattributes)
- [stackoverflow.com - 'How do I add a custom merge strategy?'](https://stackoverflow.com/questions/23140240/git-how-do-i-add-a-custom-merge-strategy)
- [stackoverflow-com - 'Add a git merge driver to the repository'](https://stackoverflow.com/questions/8839496/add-a-git-merge-driver-to-the-repository)
