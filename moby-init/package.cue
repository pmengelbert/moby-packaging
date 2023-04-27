package archive

"moby-init": [DISTRO=#enumDistros]: {
    webpage: "https://github.com/krallin/tini"
    description: "tiny but valid init for containers\n Tini is the simplest init you could think of.\n .\n All Tini does is spawn a single child (Tini is meant to be run in a\n container), and wait for it to exit all the while reaping zombies and\n performing signal forwarding."

}

"moby-init": [DISTRO=#enumLinuxDistros]: {
    binaries: [
  "/build/src/build/tini-static"
]
    files: [
  {
    "source": "/build/src/build/tini-static",
    "dest": "usr/bin/docker-init"
  },
  {
    "source": "/build/legal/LICENSE",
    "dest": "/usr/share/doc/moby-init/LICENSE"
  },
  {
    "source": "/build/legal/NOTICE",
    "dest": "/usr/share/doc/moby-init/NOTICE.gz",
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
"moby-init": [DISTRO=#enumDebDistros]: {
    runtimeDeps: []
    recommends: []
    conflicts: [
  "tini"
]
    replaces: [
  "tini"
]
    installScripts: []
}
"moby-init": [DISTRO=#enumRPMDistros]: {
    runtimeDeps: []
    recommends: []
    conflicts: []
    replaces: []
    installScripts: []
}
"moby-init": windows: {
    runtimeDeps: []
    recommends: []
    conflicts: []
    replaces: []
    installScripts: []
}
for distro in #AllDistros {
    "moby-init": "\(distro)": {}
}
