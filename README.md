# hello_webpage_chef

[![Build Status](https://travis-ci.org/aaronblythe/hello_webpage_chef.svg?branch=master)](https://travis-ci.org/aaronblythe/hello_webpage_chef)

Simple chef cookbook to exhibit how to do simple things. Exhibits how to use test kitchen in multiple ways.

# Testing

## Kitchen Testing
[Kitchen](http://kitchen.ci) is a great way to test locally or even in a CI pipeline.

### Virtualbox

To test with Vagrant/Virtualbox on a machine with the tools already installed simply run from the cookbook root:

```
kitchen converge
kitchen verify
```

or 

```
kitchen test
```
### Docker

To test first set:

```
KITCHEN_YAML=.kitchen.docker.yml
```
then run your kitchen commands

### Note: kitchen testing in ec2

You will either need to bundle install or

`chef gem install kitchen-ec2`

Then you will need to set the kitchen yaml file

```bash
export KITCHEN_YAML=".kitchen.cloud.yml"
export AWS_ACCESS_KEY="<key>"
export AWS_SECRET_KEY="<secret>"
export AWS_SSH_KEY_ID="<id>"
export AWS_SSH_KEY_FULL_PATH="/path/to/file.pem"
```