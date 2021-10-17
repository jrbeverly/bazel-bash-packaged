load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

def bats_test(name, srcs, image, tars):
    pkg_tar(
        name = "%s.bundle" % (name),
        srcs = srcs,
        package_dir = "/opt/tests",
    )

    container_image(
        name = "%s.img" % (name),
        base = image,
        cmd = ["/bin/bash"],
        entrypoint = "",
        tars = tars + [":%s.bundle" % (name)],
    )

    container_test(
        name = name,
        configs = [
            "//bazel/macros:bootstrap.yaml",
        ],
        image = ":%s.img" % (name),
    )
