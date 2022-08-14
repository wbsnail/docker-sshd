#!/bin/bash
rm -rf hostKeys
mkdir hostKeys
ssh-keygen -q -t rsa -f hostKeys/ssh_host_rsa_key -N "" -C ""
ssh-keygen -q -t ecdsa -f hostKeys/ssh_host_ecdsa_key -N "" -C ""
ssh-keygen -q -t ed25519 -f hostKeys/ssh_host_ed25519_key -N "" -C ""
