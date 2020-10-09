a. Start a pipeline and instrument the same sample bank app in a docker.
b. Leverage the learning from Phase-I to fire load-tests on the sample app & help DT identify the load-test cycle.
c. Validate the load-test to qualify if the build can proceed to Production?
d. Preserve the logs of the load test and pull the critical time-series metrics from the DT and save these as artifacts (so that the app-team can look into it later).
e. Proceed with Production deployment if the load-test did not run into any issues.
f. Warm the production by firing some load tests and additional sanity test.
g. Repeat step(d) for production docker before qualifying the build is suitable to run as production.
