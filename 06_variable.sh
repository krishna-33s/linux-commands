#!/bin/bash


echo "all args pass:$@"
echo "home:$HOME"
echo "user:$USER"
echo "no.of variables passed:$#"
sleep 100&
echo "present directory:$PWD"
echo "pid:$$"
echo "script name:$0"
echo "recently background pid:$!"
echo "all args passed:$*"