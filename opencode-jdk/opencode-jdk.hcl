group "default" {
    targets = ["opencode-jdk"]
}

variable "PROJECT_DIR" {
    type = string
}

variable "CI_REGISTRY" {
    type = string
}

target "opencode-jdk" {
    name = "opencode-jdk-${jdk_version}"
    matrix = {
        jdk_version = ["17", "21", "25"]
    }
    context = "${PROJECT_DIR}/opencode-jdk"
    dockerfile = "base/Dockerfile"
    args = {
        JDK_VERSION = jdk_version
    }
    platforms = ["linux/amd64", "linux/arm64"]

    tags = [
        "${CI_REGISTRY}/opcal/opencode-jdk:${jdk_version}"
    ]
}
