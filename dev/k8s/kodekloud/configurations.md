# Configurations 
## Differences Between CMD and EntryPoint in Dockerfile
- CMD: 
    - specifies the default command to run when a container starts.
    - can be override when running the container using `docker run`
    - can be used to set default args for container 
    - supports 2 forms 
        - exec form: CMD ["executable", "arg1", "arg2"] (preferred, runs directly as a process).
        - shell form: CMD command arg1 arg2 (runs inside a shell, e.g., /bin/sh -c).
        - default args for entrypoint: CMD ["arg1", "arg2"] (provides arguments to ENTRYPOINT).
    - If no CMD is specified, Docker does not provide a default command, and the container may fail to start unless an ENTRYPOINT is defined or a command is provided at runtime.
- ENTRYPOINT:
    - defines the main executable of the container, which runs every time the container starts
    - designed to make the container behave like a specific executable with arguments that can be appended
    - not overridden be default, any arguments provided in docker run are appended to the ENTRYPOINT command (in exec form).
    - To override, you must use the --entrypoint flag in docker run.
    - supports exec and shell forms:
        - Exec form: ENTRYPOINT ["executable", "arg1", "arg2"] (preferred).
        - Shell form: ENTRYPOINT command arg1 arg2 (runs in a shell).
    - Defines the primary executable, and CMD acts as its default arguments.


## Commands & Args in K8S
- The args field in the Kubernetes definition effectively overrides the default CMD instruction defined in the Dockerfile.
```yml
apiVersion: v1
kind: Pod
metadata:
  name: ubuntu-sleeper-pod
spec:
  containers:
    - name: ubuntu-sleeper
      image: ubuntu-sleeper
      args: ["10"]
```
- the command field replaces the ENTRYPOINT from the Dockerfile
```yml
apiVersion: v1
kind: Pod
metadata:
  name: ubuntu-sleeper-pod
spec:
  containers:
    - name: ubuntu-sleeper
      image: ubuntu-sleeper
      command: ["sleep2.0"]
      args: ["10"]
```

## ConfigMap
- to pass a environment variable to a container for example in run time use `-e ENV_NAME=value`
- in yml definition file `env` section doing the same effect by creating and passing the env to the container 
```yml
apiVersion: v1
kind: Pod
metadata:
  name: simple-webapp-color
spec:
  containers:
  - name: simple-webapp-color
    image: simple-webapp-color
    ports:
    - containerPort: 8080
    env:
    - name: APP_COLOR
      value: pink

```



## Limits and Requests in Resource Management 
- **Request**: Specifies the minimum amount of resources (CPU or memory) that a container is guaranteed to have.
  - Ensures the container gets at least the requested resources, assuming the node has sufficient capacity.
  - Requests are used for resource allocation but don't cap usage; a container can use more resources if available.
- **Limits**: Specifies the maximum amount of resources (CPU or memory) that a container can use.
  - Caps the resource usage to prevent a container from consuming excessive resources and impacting other containers or the node.
  - CPU Limits: If a container exceeds its CPU limit, it is throttled (its CPU usage is restricted).
  - Memory Limits: If a container exceeds its memory limit, it may be terminated (OOM killed) by Kubernetes.
- types of k8s resources files to ensure resource limits for pods in cluster: 
  - **ResourceQuota** and **LimitRange**: Kubernetes allows setting default requests/limits and quotas at the namespace level to enforce resource policies.




## Service Account 
- identity used by processes or workloads running in a pod to interact with the Kubernetes API or other external services.
- It is automatically created for each namespace (e.g., default, kube-system) or can be manually created.
- Pods are associated with a Service Account, which provides them with a token (JWT) to authenticate with the Kubernetes API server.
- Service Accounts are tied to Role-Based Access Control (RBAC) policies to define what actions a pod or process can perform.
- 
```yml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: my-service-account
  namespace: my-namespace
---
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
  namespace: my-namespace
spec:
  serviceAccountName: my-service-account
  containers:
  - name: my-container
    image: nginx
```