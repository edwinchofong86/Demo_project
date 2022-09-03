# Demo_project
Questions
1. Docker-ayes: Write a Dockerfile to run Bitcoin Core 22.0 in a container. It should
somehow verify the checksum of the downloaded release (there's no need to build the
project), run as a normal user, and when run without any modifiers (i.e. docker run
somerepo/bitcoin:22.0) should run the daemon, and print its output to the console. The
build should be security conscious (and ideally pass a container image security test such
as Anchore).
2. k8s FTW: Write a set of Kubernetes resources to run the above. Use best practices for
security and availability/robustness. (If you are not familiar with k8s, you can try
answering question 7 instead)
3. All the continuouses: Write a simple build and deployment pipeline for the above using
some CI system (Jenkins, Travis CI, Gitlab CI, etc). It should build and validate the
container image, and then deploy it to an arbitrary k8s cluster (either local or remote)
and verify the resources become healthy. If you’re using Nomad (question 7), do the
same thing but deploy into an arbitrary Nomad cluster.
4. Bash script kiddies: Assume you have a web server request log in the following format
(one entry per line):
○ <timestamp> <ip address> <http path> <http verb> <user
agent>
○ Example: [29/Sep/2021:10:20:48+0100] 192.168.21.34 /healthz
GET Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)
○ Write a bash script that calculates the frequency that each IP address
appears in the log file, and displays the results in descending sorted
order.
○ Example output:
23 192.168.22.11
18 10.32.89.34
5 172.32.9.12
1 121.89.25.43
[...]
○ Provide the example log file you used so we can verify your script works
correctly.
5. Script grown-ups: Solve the problem in question 4 using any programming language you
like.
6. Terraform lovers unite: write a Terraform module that creates the following resources in
IAM;○ A role, with no permissions, which can be assumed by users within the same
account,
○ A policy, allowing users / entities to assume the above role,
○ A group, with the above policy attached,
○ A user belonging to the above group.
○ All four entities should have the same name, or be similarly named in some
meaningful way given the context e.g. prod-ci-role, prod-ci-policy, prod-ci-group,
prod-ci-user; or just prod-ci. Make the suffixes toggleable, if you like.
7. Nomad users WAGMI: Write a Nomad job spec that runs the container from question 1,
and has the same requirements as question 2.
