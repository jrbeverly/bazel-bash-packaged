# Bazel Bash Packaged

Experimenting with using Bazel & Bats in container images for writing up tests for shell scripts.

## Notes

Sometimes while developing things it can be useful to have a small shell script that performs a simple action or operation, that in the short-term makes sense as a shell script. In this case, it can be useful to add some simple tests to ensure that:

1) The script is runnable
2) Simple transformations work as expected
3) Any environment variable or file references work as intended

This isn't intended for cases where a shell script is increasing in complexity, but rather where it acts as 'Glue' responsible for filling in gaps that might exist in a system.

Some minor notes about this process are included below:

- Using docker allows avoiding requiring the expected toolchains to be installed locally (or defined in bazel)
- The Bats image is used instead of installed bats onto an image. Installing bats onto an existing image might be a better option
- Container tests can check other properties of the executable shell scripts (as it should be packed the same as it would be for other targets)