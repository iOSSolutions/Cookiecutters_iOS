#!/bin/sh
echo "******* Xcode Project created Successfully at $(pwd) ..."
echo "******* Updating Carthage....."
carthage update --platform iOS
