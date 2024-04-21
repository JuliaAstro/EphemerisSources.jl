#!/bin/bash

mv _manuscript _paper
mkdir -p _manuscript/paper
mv _paper/* _manuscript/paper 
rmdir _paper