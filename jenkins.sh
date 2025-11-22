#!/bin/bash

robot -v BROWSER:chrome -V browserstack/browserstack.yaml testCases/

 robot -v BROWSER:firefox -V browserstack/browserstack.yaml testCases/

 robot -v BROWSER:safari -V browserstack/browserstack.yaml testCases/
