variable "TARGET_REPO" {}
variable "TARGET_TAG" {}
variable "ORIGIN_IMAGE" {}

group "default" {
    targets = ["linux-amd64", "linux-arm64-v8", "linux-arm"]
}

target "linux-amd64" {
    tags = ["${TARGET_REPO}:${TARGET_TAG}-amd64"]
    platforms = ["linux/amd64"]
    args = {
        ORIGIN_DOCKER_IMAGE = "${ORIGIN_IMAGE}:${TARGET_TAG}-amd64"
    }
}

target "linux-arm64-v8" {
    tags = ["${TARGET_REPO}:${TARGET_TAG}-arm64"]
    platforms = ["linux/arm64/v8"]
    args = {
        ORIGIN_DOCKER_IMAGE = "${ORIGIN_IMAGE}:${TARGET_TAG}-arm64"
    }
}

target "linux-arm" {
    tags = ["${TARGET_REPO}:${TARGET_TAG}-arm"]
    platforms = ["linux/arm"]
    args = {
        ORIGIN_DOCKER_IMAGE = "${ORIGIN_IMAGE}:${TARGET_TAG}-arm"
    }
}