package archive

"moby-runc": [DISTRO=#enumDistros]: {
    webpage: "https://github.com/opencontainers/runc"
    description: "CLI tool for spawning and running containers according to the OCI specification\n  runc is a CLI tool for spawning and running containers according to the OCI\n  specification."

}

"moby-runc": [DISTRO=#enumLinuxDistros]: {
    binaries: [
  "/build/src/runc"
]
    files: [
  {
    "source": "/build/src/runc",
    "dest": "/usr/bin/runc"
  },
  {
    "source": "/build/src/contrib/completions/bash/runc",
    "dest": "/usr/share/bash-completion/completions/runc"
  },
  {
    "source": "/build/man",
    "dest": "/usr/share/man",
    "isDir": true,
    "compress": true
  },
  {
    "source": "/build/legal/LICENSE",
    "dest": "/usr/share/doc/moby-runc/LICENSE"
  },
  {
    "source": "/build/legal/NOTICE",
    "dest": "/usr/share/doc/moby-runc/NOTICE.gz",
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
"moby-runc": [DISTRO=#enumDebDistros]: {
    runtimeDeps: []
    recommends: []
    conflicts: [
  "runc",
  "moby-engine (<= 3.0.10)"
]
    replaces: [
  "runc"
]
    installScripts: []
}
"moby-runc": [DISTRO=#enumRPMDistros]: {
    runtimeDeps: [
  "/bin/sh",
  "container-selinux >= 2:2.95",
  "device-mapper-libs >= 1.02.90-1",
  "iptables",
  "libcgroup",
  "libseccomp >= 2.3",
  "moby-containerd >= 1.3.9",
  "moby-runc >= 1.0.2",
  "systemd-units",
  "tar",
  "xz"
]
    recommends: []
    conflicts: [
  "runc",
  "runc-io"
]
    replaces: []
    installScripts: []
}
"moby-runc": windows: {
    runtimeDeps: []
    recommends: []
    conflicts: []
    replaces: []
    installScripts: []
}
for distro in #AllDistros {
    "moby-runc": "\(distro)": {}
}
