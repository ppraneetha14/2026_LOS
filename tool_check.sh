#!/bin/bash

echo "Enter the name of the tool: "
read tool

if which $tool
then
	echo "$tool is installed."
else
	echo "$tool is not installed."
fi
