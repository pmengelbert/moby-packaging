package archive

"moby-cli": [DISTRO=#enumDistros]: {
    webpage: "https://github.com/docker/cli"
    description: "Docker container platform (client package)\n Docker is a platform for developers and sysadmins to develop, ship, and run\n applications. Docker lets you quickly assemble applications from components and\n eliminates the friction that can come when shipping code. Docker lets you get\n your code tested and deployed into production as fast as possible.\n .\n This package provides the \"docker\" client binary (and supporting files)."

}

"moby-cli": [DISTRO=#enumLinuxDistros]: {
    binaries: [
  "/build/src/build/docker"
]
    files: [
  {
    "source": "/build/src/build/docker",
    "dest": "/usr/bin/docker"
  },
  {
    "source": "/build/src/contrib/completion/zsh/_docker",
    "dest": "/usr/share/zsh/vendor-completions/_docker"
  },
  {
    "source": "/build/legal/LICENSE",
    "dest": "/usr/share/doc/moby-cli/LICENSE"
  },
  {
    "source": "/build/legal/NOTICE",
    "dest": "/usr/share/doc/moby-cli/NOTICE.gz",
    "compress": true
  },
  {
    "source": "/build/src/contrib/completion/bash/docker",
    "dest": "/usr/share/bash-completion/completions/docker",
    "compress": true
  }
]
}

[PACKAGE=#enumWinPackages]: windows: {
    binaries: [
  "/build/src/build/docker.exe"
]
}

[PACKAGE=#enumNonWinPackages]: windows: {
    binaries: []
}
"moby-cli": [DISTRO=#enumDebDistros]: {
    runtimeDeps: []
    recommends: [
  "ca-certificates",
  "git",
  "moby-buildx",
  "pigz",
  "xz-utils"
]
    conflicts: [
  "docker",
  "docker-ce",
  "docker-ce-cli",
  "docker-ee",
  "docker-ee-cli",
  "docker-engine",
  "docker-engine-cs",
  "docker.io",
  "lxc-docker",
  "lxc-docker-virtual-package"
]
    replaces: [
  "docker",
  "docker-ce",
  "docker-ce-cli",
  "docker-ee",
  "docker-ee-cli",
  "docker-engine",
  "docker-engine-cs",
  "docker.io",
  "lxc-docker",
  "lxc-docker-virtual-package"
]
    installScripts: [
  {
    "when": "postinstall",
    "script": "#moby-cli/postinstall/deb/postinst"
  }
]
}
"moby-cli": [DISTRO=#enumRPMDistros]: {
    runtimeDeps: [
  "/bin/sh",
  "container-selinux >= 2:2.95",
  "device-mapper-libs >= 1.02.90-1",
  "iptables",
  "libcgroup",
  "moby-containerd >= 1.3.9",
  "moby-runc >= 1.0.2",
  "systemd-units",
  "tar",
  "xz"
]
    recommends: []
    conflicts: []
    replaces: []
    installScripts: [
  {
    "when": "postinstall",
    "script": "#moby-cli/postinstall/rpm/postinst"
  }
]
}
"moby-cli": windows: {
    runtimeDeps: []
    recommends: []
    conflicts: []
    replaces: []
    installScripts: []
}
for distro in #AllDistros {
    "moby-cli": "\(distro)": {}
}
