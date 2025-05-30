# interview questions for intern devops position 

- what is the difference between namespaces and cgroups?
    - cgroups: allow administrators to limit and distribute resources among different groups of resources. they do this by grouping processes together and then applying resource limit to those groups, this ensures that no processes or group of processes are consumes too many resources, which can lead to performance problem or even system instability 
    - namespace: create isolated environments for processes, separating them from the host system and other processes, this can be used to protect processes from each other and prevent them from interfering with each others 
    - the main difference is: cgroups -> manages processes, namespaces -> isolate resources
    - Cgroups can be used to limit the amount of CPU, memory, disk I/O, and other resources that a process can use. Namespaces can be used to isolate processes from each other, such as by preventing them from seeing each other's files or network connections.
    - [reference](https://gist.github.com/rupeshtiwari/a05b108635fe7ea262d5236c1821c5d6)

- what is the difference between CMD and entrypoint in docker file?
    - entrypoint: sets the process executed when your container starts.
        - shell form: `ENTRYPOINT command arg1 arg2`
        - exec form: (more preferred) `ENTRYPOINT ["executable", "arg1", "arg2"]`
        - cmd with entrypoint sets the default arguments passed to the entrypoint process `/usr/bin/my-app help`
        ```docker
            ENTRYPOINT ["/usr/bin/my-app"]
            CMD ["help"]
        ```
        - images can have only one entrypoint
    - cmd: specify the default commands to run when a container is started from the image.
        - Shell form: This form uses a shell (e.g., /bin/sh -c on Linux) to run the command, CMD command arg1 arg2.
        - Exec form (Recommended): CMD ["executable", "arg1", "arg2", ...]
        - As default parameters for ENTRYPOINT: CMD ["arg1", "arg2", ...]
        - 
    - the difference between docker run command and entrypoint: when no further arguments are given, the process that runs in the container will exactly match the entrypoint and cmd defined in the image
        - changing and overriding arguments of cmd is done in docker run command `$ docker run my-image:latest version # Executes /usr/bin/my-app version`
    - what is the difference between docker entrypoint and cmd? 
        - CMD: Specifies the default command to run when a container starts. It provides default behavior that can be overridden easily when running the container (e.g., via docker run arguments).
        - ENTRYPOINT: Defines the main executable of the container, which is intended to be the primary process. It’s less flexible for overriding, ensuring the container always runs a specific command or script.
    - [reference](https://spacelift.io/blog/docker-entrypoint-vs-cmd)

- what are special permissions ?
    - set user id (SUID): is a special type of permissions that allows a user to execute a file with permissions of the file owner rather than the user who launched it, this is useful for executables that need to perform tasks that require higher privileges.
    - set group id (SGID): similar to SUID but for groups id, is set on directory any files created within that directory will inherit the group ownership of the directory, not the primary group of the user who created the file.
    - sticky bit: is set on a directory and prevents a user from deleting or renaming files in that directory unless they are the owner of the file or the directory, useful for `/tmp` directory to prevent user could delete or rename file they don't own.
    - [reference](https://dev.to/mbayoun95/linux-special-permissions-a-comprehensive-guide-with-examples-31pg)

- what is inode in linux? 
    - it's an index node data structure in a filesystem, it serves as a unique identifier for a specific piece of metadata on given filesystem, operates on each filesystem, independent of the others 
    - [reference](https://www.redhat.com/en/blog/inodes-linux-filesystem)


- what is the difference between symbolic link and physical link?
    - symbolic file: a special file that points to the path of another file or directory, in general it creates a file that has a new metadata about the referenced file that it points to 
        - useful for creating a shortcuts, like linking to a configuration file in multiple locations or pointing to a file on another system.
        - symbolic link is broken when deleting the original file

    - physical path: a direct reference to the same file as the original file, only applied to files, in general it creates a pointer to the existing file which is the original one, no additional file created which means that is the metadata is equal to the original file 
        - useful for creating multiple references to the same file without duplicating data, like versioning files without copying them.
        - in deletion case after deleting the original file, the physical link for the original file is still exist and can be display it's content 

    - [reference](https://julioarenas85.medium.com/what-is-the-difference-between-a-physical-link-and-a-symbolic-link-ddb59dd77037)


- what is the stateful and stateless firewall?
    - 
- what is the difference between asymmetric and symmetric ?

- how to get the changes that are deleted using reset --hard in git ?

- what is GitOps ?
    - is a set of 

- what are types of consistences ?

- how aws lambda works ?


- what is the services types in k8s ?
- what is DaemonSet in k8s?