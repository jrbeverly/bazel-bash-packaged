# Bazel Bash Packaged

Experimenting with using Bazel & Bats in container images for writing up tests for shell scripts.

## Notes

- Using docker allows avoiding ensuring tools like curl/jq/yq are available for the test
- Install bats onto a docker image, then running the tests would be more ideal (realistic environment)
- Container tests can check other properties of the executable shell scripts