# Docfav

Therapists marketplace

## Getting Started

### Prerequisites

Before starting with specific steps of the project, the following needs to be installed:

```
    Virtualbox https://www.virtualbox.org/wiki/Downloads version: >= 5.0
    Vagrant: https://www.vagrantup.com/downloads.html version: >= 2.0 (Recommended 2.2.4)
```

### Installing

1. Download virtualbox-docfav-ubuntu1804.box using the following command:

    ```
        curl -L http://integration.docfav.com/docfav/virtualbox-docfav-ubuntu1804.box --output <path>/virtualbox-docfav-ubuntu1804.box 
    ```

2. Add downloaded box as "docfav"

    ```
        vagrant box add --name docfav <path>/virtualbox-docfav-ubuntu1804.box
    ```

    In the case this box already exists on your sistem (because we want to update it with a new one for example):

    ```
        vagrant box remove docfav

        vagrant box add --name docfav <path>/virtualbox-docfav-ubuntu1804.box
    ```
3. Delete the box as it's no longer needed
    
    ```
        rm virtualbox-docfav-ubuntu1804.box
    ```

4. Modify and add to your Mac/Linux: /etc/hosts; Windows: %systemroot%\system32\drivers\etc\hosts

    ```
        192.168.33.10       api.dev.docfav.lab
    ```

5. Start the machine

    ```
        vagrant up
    ```

    **This command will only work if your working directory is the project root. It will execute specifications provided in Vagrantfile and map current directory to /var/www/docfav. Apache is serving /var/www/docfav/public.**


#### Accessing the machine

You will be able to log in to the machine like this:

    vagrant ssh (password: docfav)

To avoid having to type the password everytime you can:

    ssh-copy-id -i your_rsa.pub docfav@192.168.33.10

**Note**: If the box is destroyed, this step needs to be repeated


#### Command examples to work with Vagrant

```
    vagrant up -> powers up the virtual machine

    vagrant halt -> powers off the virtual machine and save its state

    vagrant status -> shows virtual machine status

    vagrant reload -> vagrant halt + vagrant up

    vagrant destroy -> remove virtual machine

    vagrant global-status --prune -> show global machines list and status (non cached version)

```


## Running the tests (TO BE COMPLETED)

Explain how to run the automated tests for this system

### Break down into end to end tests (TO BE COMPLETED)

Explain what these tests test and why

```
Give an example
```

### And coding style tests (TO BE COMPLETED)

Explain what these tests test and why

```
Give an example
```

## Deployment (TO BE COMPLETED)

Add additional notes about how to deploy this on a live system

## Built With (TO BE COMPLETED)

* [Symfony](https://symfony.com/doc/current/index.html#gsc.tab=0) - The web framework used
* [Composer](https://getcomposer.org/doc/) - Dependency management tool
* [PHPUnit](https://phpunit.readthedocs.io/en/8.0/) - PHP Testing tool
* [Vagrant](https://www.vagrantup.com/downloads.html) - Tool for handling virtual software development environments

### GIT

Commits are written using the following template: https://gist.github.com/adeekshith/cd4c95a064977cdc6c50

In order to use it, use the following command:

```
    curl https://gist.github.com/adeekshith/cd4c95a064977cdc6c50 --output <path>/git-commit-template.txt 

    git config commit.template <path>/git-commit-template.txt
```

Additionally, set your name and email:

```bash
  git config user.name <name>
  git config user.email <email>
```

## Methodology (TO BE COMPLETED)

SCRUM videos (Spanish)
https://www.youtube.com/watch?v=Ng65pzl3RqM

https://www.youtube.com/watch?v=uzRy7a98vqg

https://martinfowler.com/articles/itsNotJustStandingUp.html

https://manifesto.co.uk/scrum-practice-sprint-demo/

REST

https://www.restapitutorial.com/

## Authors

* **Markel Arauzo** - [markelarauzo7](https://github.com/markelarauzo7)
* **Mikel Garces** - [goear](https://github.com/goear)


