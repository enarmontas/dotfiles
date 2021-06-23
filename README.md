# Dotfiles
Minimalist `dotfiles` repository.

### Setup
I am using Ansible role
[geerlingguy/ansible-role-dotfiles](https://github.com/geerlingguy/ansible-role-dotfiles) and my
localhost setup playbook
[enarmontas/ansible-localhost](https://github.com/enarmontas/ansible-localhost)
to configure this repository. It clones the repository to custom path and links the specified
dotfiles to my home directory. Every time I edit any of the files, I can then commit the changes
to this repository.

### Private Files
Some details are private and only required on certain systems, such as work computer. I made sure
this config dynamically includes `~/.gitconfig.local` and `~/.localrc` for configuring Git
credentials and private environment variables.

#### Example
Configure your Git user name and email in `~/.gitconfig.local`:
```
[user]
  name = First Last
  email = first.last@example.com
```

Configure environment variables specific to your environment in `~/.localrc`:
```
export CUSTOM_ENV_VARIABLE=example
```
