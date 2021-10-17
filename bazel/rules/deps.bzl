load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//docker/util:run.bzl", "container_run_and_commit")

def bats_image(name, image):
    container_image(
        name = "%s_base" % (name),
        base = image,
        entrypoint = [""],
    )

    container_run_and_commit(
        name = "%s_install" % (name),
        commands = [
            "apk add --no-cache curl jq",
        ],
        image = ":%s_base.tar" % (name),
    )
    
    container_image(
        name = name,
        base = ":%s_install_commit.tar" % (name),
    )
