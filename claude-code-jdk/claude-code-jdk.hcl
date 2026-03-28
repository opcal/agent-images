group "default" {
    targets = ["claude-code-jdk"]
}

variable "PROJECT_DIR" {
    type = string
}

variable "CI_REGISTRY" {
    type = string
}

target "claude-code-jdk" {
    name = "claude-code-jdk-${jdk_version}"
    matrix = {
        jdk_version = ["17", "21", "25"]
    }
    context = "${PROJECT_DIR}/claude-code-jdk"
    dockerfile = "base/Dockerfile"
    args = {
        JDK_VERSION = jdk_version
    }
    platforms = ["linux/amd64", "linux/arm64"]

    tags = [
        "${CI_REGISTRY}/opcal/claude-code-jdk:${jdk_version}"
    ]
}
