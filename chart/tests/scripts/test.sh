#!/bin/bash

set -e

mimir_timeout=$((6*60))
echo "MIMIR URL: ${MIMIR_URL}"
echo "Hitting mimir /ready endpoint..."
time curl --retry-delay 2 --retry-max-time ${mimir_timeout} --retry $((mimir_timeout/2)) --retry-connrefused -sIS "${MIMIR_URL}/ready" 1>/dev/null || mimir_ec=$?
# time output shows up a bit after the next two echoes, sleep for formatting
sleep .1
if [ -n "${mimir_ec}" ]; then
  echo "curl returned exit code ${mimir_ec}, see above for error message and curl's elapsed wait time (timeout is ${mimir_timeout}s)"
  exit 1
fi
echo "Test 1 Success: mimir is up, see above for curl's elapsed wait time."

echo "Hitting mimir /metrics endpoint..."
time curl --retry-delay 2 --retry-max-time ${mimir_timeout} --retry $((mimir_timeout/2)) --retry-connrefused -sIS "${MIMIR_URL}/metrics" 1>/dev/null || mimir_ec=$?
# time output shows up a bit after the next two echoes, sleep for formatting
sleep .1
if [ -n "${mimir_ec}" ]; then
  echo "curl returned exit code ${mimir_ec}, see above for error message and curl's elapsed wait time (timeout is ${mimir_timeout}s)"
  exit 1
fi
echo "Test 2 Success: mimir metrics endpoint returned "

## This test might be good for extending to check appVersion etc
echo "Hitting mimir /mimir/api/v1/status/buildinfo endpoint..."
time curl --retry-delay 2 --retry-max-time ${mimir_timeout} --retry $((mimir_timeout/2)) --retry-connrefused -sIS "${MIMIR_URL}/mimir/api/v1/status/buildinfo" 1>/dev/null || mimir_ec=$?
# time output shows up a bit after the next two echoes, sleep for formatting
sleep .1
if [ -n "${mimir_ec}" ]; then
  echo "curl returned exit code ${mimir_ec}, see above for error message and curl's elapsed wait time (timeout is ${mimir_timeout}s)"
  exit 1
fi
echo "Test 3 Success: mimir buildinfo endpoint returned "

# Test services
echo "Hitting mimir /services..."
time curl --retry-delay 2 --retry-max-time ${mimir_timeout} --retry $((mimir_timeout/2)) --retry-connrefused -sIS "${MIMIR_URL}/services" 1>/dev/null || mimir_ec=$?
# time output shows up a bit after the next two echoes, sleep for formatting
sleep .1
if [ -n "${mimir_ec}" ]; then
  echo "curl returned exit code ${mimir_ec}, see above for error message and curl's elapsed wait time (timeout is ${mimir_timeout}s)"
  exit 1
fi
echo "Test 4 Success: mimir services endpoint returned "

### Test if there are any non-successful pods

# TODO: implement this in next story, require RBAC access
#  may require RBAC access
#  resource:
#    https://repo1.dso.mil/big-bang/product/packages/thanos/-/tree/main/chart/templates/bigbang/upgrade?ref_type=heads
#    See the rbac, role, and service account

### Query mimir namespace and print status column
### that is not "Running" or the column header "STATUS"
# OUTPUT=$(kubectl get po -n mimir | awk '{print $3}' | awk '$0 != "Running" && $0 != "STATUS"')
# sleep .1
# if [ -z "$OUTPUT" ]; then
#   echo "Test 5 Success: mimir has all services running."
# else
#   echo "Test 5 Failure: we have a non-running mimir service."
#   exit 1
# fi