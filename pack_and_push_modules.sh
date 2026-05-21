#!/bin/bash

# Script to run bal pack and bal push for each module in ballerina folder
set -e

# Base directory
BASE_DIR="/Users/dilanperera/Projects/module-ballerinax-sap.successfactors.employeecentral/ballerina"

# List of modules
MODULES=(
    "ecalternativecostdistribution"
    "ecapprenticemanagement"
    "eccompensationinformation"
    "ecdismissalprotection"
    "ecemployeeprofile"
    "ecemploymentinformation"
    "ecmasterdatareplication"
    "ecpayrolltimesheets"
    "ecpositionmanagement"
    "ecskillsmanagement"
    "ecworkflow"
    "employeecentralec"
)

echo "Starting bal pack and bal push for all modules..."
echo "=============================================="

for module in "${MODULES[@]}"; do
    echo ""
    echo "Processing module: $module"
    echo "----------------------------"
    
    cd "$BASE_DIR/$module"
    
    echo "Running bal pack for $module..."
    if bal pack; then
        echo "✅ bal pack successful for $module"
    else
        echo "❌ bal pack failed for $module"
        continue
    fi
    
    echo "Running bal push for $module..."
    if bal push; then
        echo "✅ bal push successful for $module"
    else
        echo "❌ bal push failed for $module"
    fi
    
    echo "Completed processing $module"
done

echo ""
echo "=============================================="
echo "Finished processing all modules!"
