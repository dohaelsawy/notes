# Multi Container Pods 

## Definition 
- allow to run more than a container in a single pod without directly altering the primary application code. ex. pairing a logging service with a main service to send logs to centralized logging system
- in this case the containers shares the same lifecycle, network, namespaces, storage and volumes (ADVANTAGES)



## Init Containers 
- are special containers that run to completion before the main application containers in a pod starts
- designed to perform a setup or initialization tasks required for main container 
- in case of several init containers: each init one must complete successfully before starting the next one or starting the main container 
- in case of failure, k8s decided on `restartPolicy` if it equal to *always* it continue restarting unit success, if it equal to *never* it mark the pod status as failed 
- they in general do the task > complete > terminate 


## Design Patterns 
- SideCare Pattern
    -  containers that run alongside the main application container in a pod for the entire lifecycle of the pod 
    - designed to augment the functionality of the main service 
    - runs in parallel with the main application containers for the pod's lifecycle 
    - main container doesn't wait to start for the sidecar container, they can also be restarted independently if they exit unexpectedly.
    - restarts based on pod's `restartPolicy`
    - sidecar + init container in release up to v1.29 > are implemented as *restartable init containers* by setting `restartPolicy: Always` and are placed under the `initContainers` field.
        - this approach ensures that sidecar containers start before and terminating after the main application containers and continue running throughout the pod's lifecycle 
- Co-Located Containers 
    -  to multiple containers running within the same Pod that collaborate to achieve a common goal.
    - They can start and stop independently and may not have a defined startup order.
    
- Adapter Pattern
    - used to standardize data format  
- Ambassador pattern 
    - used when an application communicate with different db environments, works as proxy 
