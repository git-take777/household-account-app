#!/bin/bash

if [ ! -f "package.json" ]; then
    echo "Creating new React project..."
    npx create-react-app household-budget
    mv temp-app/* household-budget/.* .
    rmdir temp-app
    npm install
fi

npm start