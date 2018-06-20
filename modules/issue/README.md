#puppet-issue

##Overview
As you might know already, on *nix-based systems,  `issue` text files contain a message or system identification to be printed before the login prompt of a session (such as telnet or ssh). This module is a simple wrapper class who deals with the management of such `issue` files.

##Description
The `issue` module will handle the creation and update of `/etc/issue*` files on *nix-based systems.

This module has proven to work on the following operating systems:

* Ubuntu
 
##Requirements
* [puppetlabs/stdlib](https://github.com/puppetlabs/puppetlabs-stdlib)

##Example usage
This will create and maintain `issue` files based on the `source` file
```puppet
class { 'issue': source => 'puppet://files/some_issue.txt' }
```

###Parameters
####`[source]`
Path to the file to be inserted/updated as the `issue` file

