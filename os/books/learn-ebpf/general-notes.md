#### What is ring buffer? 
The ring buffer is a fundamental mechanism for data transfer. it's usually using by `perf` tool to transfer the event record from kernal to user space with hgh throughput.

 the ebpf program is using the `perf ring buffer` to let you write data in a structure of your choosing into a perf ring buffer map.
```c
BPF_PERF_OUTPUT(output); // BCC defines the macro BPF_PERF_OUTPUT for creating a map that will be used to pass messages from the kernel to user space. output is the name of the map

output.perf_submit(ctx, &data, sizeof(data)); // puts that data into the map.
```
eBPF program uses the semantics of a map to read and write to a global variable. Maps are also used to hold static data,

#### summary of how eBPF components interact with each others 
- program wrote in C to collect data.
- compile C program using Clang/LLVM to generate a .o file which is called the eBPF bytecode. 
- the Go program that reads the .o file and tries to inject it into the kernel > loading/attaching part can be done manually using `bpftool` commands.
- The Kernel's Verifier inspects the code. If it is safe, it allows it to run.
- The C program collects data and stores it in an eBPF Map.
- The Go program reads that eBPF Map to get the data.


#### `bpf()` system call
- used to perform a command on an extended BPF map or program.
- `bpf()`’s signature `int bpf(int cmd, union bpf_attr *attr, unsigned int size);`
    - `cmd` specifies which command to perform.
    - `attr` argument to the `bpf()` syscall holds whatever data is needed to specify the parameters for the command.
    - `size` indicates how many bytes of data there are in `attr`.
- **BTF** allows eBPF programs to be portable across different kernel versions so that you can compile a program on one machine and use it on another, which might be using a different kernel version and hence have different kernel data structures.
- `bpf()` is loading a blob of BTF data into the kernel, and the return code is a *file descriptor* that refers to that data.
    - A file descriptor is an identifier for an open file, which is then passed as an argument to other syscalls such as read() or write() to perform operations on that file.

#### things should bdiheyat after a while 
- eBPF programs use helper functions to read and write to maps.
