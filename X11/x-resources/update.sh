#!/usr/bin/env bash

echo "=> updating X-resources"
xrdb -merge "$HOME/.Xresources"
