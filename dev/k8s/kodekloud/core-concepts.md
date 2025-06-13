# Core Concepts 

## Recap Architecture 
- node: is a machine, physical or virtual on which k8s is installed
- cluster: set of nodes grouped together, so if one goes down application still accessible via other node 
- master/worker: master is a node that is responsible for managing the cluster, worker is responsible for having pods up and running 
- k8s components: 
    - **API controller**: acts as the front end for k8s, the users, managements devices, cli, all talk to API server to interact with k8s cluster.
    - **etcd**: distributed reliable key-value store used by k8s to store all data used to manage the cluster, responsible to implement locks within the cluster to ensure that there are no conflicts between the masters.
    - **schedular**: responsible for distributing work or containers across multiple nodes, looks for newly created containers and assigns them to nodes. 
    - **kubelet**: is the agent that is run on each node in the cluster, responsible to ensure that containers are running on the nodes as expected.
    - **controller**: the brain behind orchestration, responsible for noticing and responding when nodes, containers or end points goes down, make decisions to bring up new containers in such cases.
    - **container runtime**: underline software that is used to run containers. 

- what makes a node master and other a worker?
    - master node has a API controller component which used to interact with the master node and cluster, all infos are stored in etcd, and also has a controller and schedular 
    - worker node holds the running container so it has the container runtime and kubelet which is responsible to send a health information of the worker node and carry out actions requested by the master on the worker node 


## pods 
- is a single instance of an application, smallest object that can be created in k8s 
- a pod has a one-to-one relation with the container inside, if intention was to scale up it should increase more pods not containers inside pods 
- in multi-containers in pod the containers is not from the same kind, it usually a helper container and they can communicate via localhost since they both share thw same network and share the same storage


## create pods via yaml file 
- top level/root level properties
```yml
appVersion: # the version of k8s api to create the objects
kind: # type of object that we want to create 
metadata: # dictionary of some properties as name, labels which is also a dictionary helps with identifying objects later on
spec: # dictionary that holds infos about the object we want to create, ex. if creating a pod, there will be a section of containers which is array and it has a name and image properties 
```
- varies types of `apiVersion`
    - kind                    version
    - Pods,Services         -> v1,
    - ReplicaSet/Deployment -> apps/v1
    - etc..

## Replication Controller vs Replica Set
- Replication Controller: ensures that a  specified number of pods are running at all times, uses also as a load distribution
    - apiVersion: v1
    - kind: ReplicationController
    - metadata: Contains the name (myapp-rc) and labels (app and type) for identification.
    - spec: Defines the desired state, including the number of replicas and a Pod template.
    ```yml
    # rc-definition.yaml
    apiVersion: v1
    kind: ReplicationController
    metadata:
    name: myapp-rc
    labels:
        app: myapp
        type: front-end
    spec:
    replicas: 3
    template: # pod definition 
        metadata:
        name: myapp-pod
        labels:
            app: myapp
            type: front-end
        spec:
        containers:
            - name: nginx-container
            image: nginx

    ```
- ReplicaSets: modern, recommended approach for ensuring a specified number of Pod replicas.
    - apiVersion: apps/v1
    - kind: ReplicaSet
    - metadata: metadata and template: Similar to the replication controller, but with an additional required field.
    - **selector**: The matchLabels selector identifies which Pods are managed by the ReplicaSet. This field is important because it allows the ReplicaSet to adopt existing Pods that match the provided labels.
    ```yml
    # replicaset-definition.yaml
    apiVersion: apps/v1
    kind: ReplicaSet
    metadata:
    name: myapp-replicaset
    labels:
        app: myapp
        type: front-end
    spec:
    replicas: 3
    selector:
        matchLabels:
        type: front-end # > should match
    template:
        metadata:
        name: myapp-pod
        labels:
            app: myapp
            type: front-end # > should match
        spec:
        containers:
            - name: nginx-container
            image: nginx
    ```
    - Even if the Pods already exist, the ReplicaSet will only create new ones if an existing Pod dies, ensuring that the desired number is maintained.


## Deployments 
- **Rolling Update** allows you to upgrade instances one by one, and if an error occurs, you can quickly roll back to a stable version
    - apiVersion: apps/v1
    - Metadata: Provides a unique name (myapp-deployment) and labels to identify the Deployment.
    - Specification (spec):
        - Replicas: Defines the desired number of pod copies.
        - Selector: Matches the defined labels.
        - Template: Describes the pod configuration, including container specifications.
- k8s Deployments not only simplify the management of your application’s lifecycle but also provide powerful features such as **automated scaling**, **rolling updates**, and **instant rollback capabilities**.

## Namespaces
- separate resources and rules 
- k8s creates internal namespaces such as 
    - **kube-system**: which contains system components and keeps them isolated from user modifications
    - **kube-public**: designed for resources that should be accessible to all users
- in the same namespaces, services can communicate with each other by it's service name 
- in different namespaces, services can communicate by the following format: *service-name.namespace.svc.cluster.local*
    - cluster.local: is the default domain name of the cluster
    - svc is the subdomain for services
- creating a namespace file definition 
```yml
apiVersion: v1
kind: Namespace
metadata:
  name: dev
``` 
- resource quotas: helps control resources usages within a namespace
```yml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: compute-quota
  namespace: dev
spec:
  hard:
    pods: "10"
    requests.cpu: "4"
    requests.memory: 5Gi
    limits.cpu: "10"
    limits.memory: 10Gi
```


## Networking 
- every node has its own IP for ssh access for example
- when cluster initiated a private network is created range 10.244.0.0/16
- each pod receives a unique IP address from this network, enabling direct pod to pod communication
- however since these internal ips can change die pods recreation, they should not be used as fixed endpoints for accessing pods 
- in multi-node in cluster, the ips of pods in both nodes may have a conflict due matching internal ips, so many solutions out there handle this issue such as  Cisco ACI, Cilium, BigCloud Fabric, Flannel, VMware NSX-T, Calico, and Weave Net.
- k8s doesn't provide a built-in mechanism to resolve ip conflicts 
- k8s roles for successfully pod communication in a cluster
    - all containers/pods much be able to communicate with one another without the need for network address translation (NAT)
    - all nodes must be able to communicate with the pods and vice verse 



## Services
- how from laptop or any device i want to access the pod that is running inside a node in internal network? solution for that without using any *services* by ssh into node and then curl http://<pod-ip>, this is not make sense due i can't give each user an access to my cluster node right the more sense solution is using services 

- services: facilitate interaction among different parts of an application, expose servers to users while ensuring smooth internal communication with other internal running services 

- services types:
    - NodePort: expose a service on a static port on each node's ip, which is uses as external access to a single or multiple pods 
        - has 3 key pods: 
            - 1. Target Port: the port on the pod where the web server is running 
            - 2. Service Port: a port on the service object itself, within the cluster.
            - 3. Node Port: an external exposed port on each node, this must be within 30000-32767
            - the only required field is service port aka port in file definition, if target port is empty it'll be as service port and if node port is empty it will assign a random port to it 
        - *selector* section is responsible for mapping between which port with which service/port 
        - yaml definition file
        ```yml
        apiVersion: v1
        kind: Service
        metadata:
            name: myapp-service
        spec:
            type: NodePort
            ports:
                - targetPort: 80 # > pod's port 
                port: 80 # > service ports (the only required field)
                nodePort: 30008 # > node port
            selector:
                app: myapp
                type: front-end
        ``` 
        - in case of multiple pods and node?
            - in case of multi pods in the same node: the Pods share the same labels, Kubernetes automatically registers all matching Pods as endpoints for the Service and distribute incoming requests among all pods randomly
            - in case of multi nodes: the service spans the entire cluster and maps the target port across all nodes, this ensures that using any node-ip:node-port will successfully access the application
        - an important note for my future self: we access the application on **node ip** NOT cluster ip, so it's in the end http://<node-ip>:<node-port>/bla-bla 
    
    - Cluster IP: for example a full stack of front-end pods needs to communicate with backend-pods and back-end communicate with db pods, how to manage this communication without using ips of each pod because it's not reliable to use due it could change once the pod die > solution, using service of type cluster ip which is the default type, it group related pods together and expose a single stable interface to communicate to 
        - yml definition
        ```yml
        apiVersion: v1
        kind: Service
        metadata:
        name: back-end
        spec:
        type: ClusterIP
        ports:
            - port: 80
            targetPort: 80
        selector:
            app: myapp
            type: back-end

        ```  

    - load balancer: route incoming traffic to the correct nodes based on the url, in supported clouds platforms can automatically integrate with the cloud provider's native load balancer 
        - yml definition
        ```yml
        apiVersion: v1
        kind: Service
        metadata:
        name: myapp-service
        spec:
        type: LoadBalancer
        ports:
            - targetPort: 80
            port: 80
            nodePort: 30008
        ```
        - if cloud provider doesn't support load balancing, it does the same effect as node port 
