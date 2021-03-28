# Python Flask - Demo Web Application

This is a simple Python Flask web application. The app provides system information and a realtime monitoring screen with dials showing CPU, memory, IO and process information.

The app has been designed with cloud native demos & containers in mind, in order to provide a real working application for deployment, something more than "hello-world" but with the minimum of pre-reqs. It is not intended as a complete example of a fully functioning architecture or complex software design.

Typical uses would be deployment to Kubernetes, demos of Docker, CI/CD (build pipelines are provided), deployment to cloud (aws) monitoring, auto-scaling

## Setup infrastructure

This project uses cloudformation to create an EKS cluster on AWS.

To create the cluster and nodes:

```bash
./infra_stack.sh create network
./infra_stack.sh create eks
./infra_stack.sh create eks-nodes
```

With these following steps you have now a cluster deployed.

## Run application

- `make setup` to setup the virtualenv 
- `make install`to install requirements for the app
- `make lint` to check lint docker and python app
- `make run_docker` if you want to run the application quicly on your local docker.
- `cd app && python app.py` to run app locally.

## Kubernetes

You can find deployment and service files for Kubernetes.
It will setup a loadbalancer endpoint to connect to the application
