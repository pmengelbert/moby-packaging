package archive

compose: [DISTRO=#enumDistros]: {
    webpage: "https://github.com/docker/compose-cli"
    description: "A Docker CLI plugin which allows you to run Docker Compose applications from the Docker CLI."
}

compose: [DISTRO=#enumLinuxDistros]: {
    binaries: [
  "/build/src/bin/docker-compose"
]
    files: [
  {
    "source": "/build/src/bin/docker-compose",
    "dest": "/usr/libexec/docker/cli-plugins/docker-compose"
  },
  {
    "source": "/build/legal/LICENSE",
    "dest": "/usr/share/doc/moby-compose/LICENSE"
  },
  {
    "source": "/build/legal/NOTICE",
    "dest": "/usr/share/doc/moby-compose/NOTICE.gz",
    "compress": true
  }
]
}

[PACKAGE=#enumWinPackages]: windows: {
    binaries: []
}

[PACKAGE=#enumNonWinPackages]: windows: {
    binaries: []
}
compose: [DISTRO=#enumDebDistros]: {
    runtimeDeps: [
  "moby-cli"
]
    recommends: []
    conflicts: [
  "docker-ce",
  "docker-ee",
  "docker-ce-cli",
  "docker-ee-cli"
]
    replaces: []
    installScripts: []
}
compose: [DISTRO=#enumRPMDistros]: {
    runtimeDeps: [
  "/bin/sh",
  "container-selinux >= 2:2.95",
  "device-mapper-libs >= 1.02.90-1",
  "iptables",
  "libcgroup",
  "moby-cli",
  "moby-containerd >= 1.3.9",
  "moby-runc >= 1.0.2",
  "systemd-units",
  "tar",
  "xz"
]
    recommends: []
    conflicts: [
  "docker-ce",
  "docker-ee"
]
    replaces: []
    installScripts: []
}
compose: windows: {
    runtimeDeps: []
    recommends: []
    conflicts: []
    replaces: []
    installScripts: []
}
for distro in #AllDistros {
    compose: "\(distro)": {}
}
