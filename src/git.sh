#!/bin/bash
args="${@}"
ssh-agent bash -c "ssh-add $SSH_KEY; git $args"
