package archive

shim: [DISTRO=#enumDistros]: {
    webpage: "https://github.com/cpuguy83/containerd-shim-systemd-v1"
    description: "A containerd shim runtime that uses systemd to monitor runc containers"
}

shim: [DISTRO=#enumLinuxDistros]: {
    binaries: [
  "/build/src/bin/containerd-shim-systemd-v1"
]
    files: [
  {
    "source": "/build/src/bin/containerd-shim-systemd-v1",
    "dest": "/usr/bin/containerd-shim-systemd-v1"
  },
  {
    "source": "/build/systemd/containerd-shim-systemd-v1.socket",
    "dest": "/lib/systemd/system/containerd-shim-systemd-v1.socket"
  },
  {
    "source": "/build/legal/LICENSE",
    "dest": "/usr/share/doc/moby-containerd-shim-systemd/LICENSE"
  },
  {
    "source": "/build/legal/NOTICE",
    "dest": "/usr/share/doc/moby-containerd-shim-systemd/NOTICE.gz",
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
shim: [DISTRO=#enumDebDistros]: {
    runtimeDeps: [
  "systemd (>= 239)",
  "moby-containerd (>= 1.6)"
]
    recommends: [
  "moby-runc"
]
    conflicts: []
    replaces: []
    installScripts: [
  {
    "when": "postinstall",
    "script": "#moby-containerd-shim-systemd/postinstall/deb/postinst"
  },
  {
    "when": "prerm",
    "script": "#moby-containerd-shim-systemd/postinstall/deb/prerm"
  },
  {
    "when": "postrm",
    "script": "#moby-containerd-shim-systemd/postinstall/deb/postrm"
  }
]
}
shim: [DISTRO=#enumRPMDistros]: {
    runtimeDeps: [
  "/bin/sh",
  "container-selinux >= 2:2.95",
  "device-mapper-libs >= 1.02.90-1",
  "iptables",
  "libcgroup",
  "moby-containerd >= 1.3.9",
  "moby-containerd >= 1.6, systemd => 239",
  "moby-runc >= 1.0.2",
  "systemd-units",
  "tar",
  "xz"
]
    recommends: []
    conflicts: []
    replaces: []
    installScripts: []
}
shim: windows: {
    runtimeDeps: []
    recommends: []
    conflicts: []
    replaces: []
    installScripts: []
}
for distro in #AllDistros {
    shim: "\(distro)": {}
}
