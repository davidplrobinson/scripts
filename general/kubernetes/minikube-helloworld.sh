#!/bin/bash

minikube start --vm-driver kvm
minikube status
kubectl run hello-minikube --image=gcr.io/google_containers/echoserver:1.4 --port=8080
kubectl expose deployment hello-minikube --type=NodePort
sleep 15
curl $(minikube service hello-minikube --url)
#minikube stop
