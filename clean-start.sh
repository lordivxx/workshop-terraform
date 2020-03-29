#!/bin/bash
 
rm -rf .terraform/
rm *.tf
rm -rf ./terraform*
cp ./skel/*.tf .
