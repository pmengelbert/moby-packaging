package archive

import (
	"github.com/Azure/moby-packaging/pkg/archive"
)

#AllDistros: [
	"bionic",
	"bullseye",
	"buster",
	"centos7",
	"focal",
	"jammy",
	"mariner2",
	"rhel8",
	"rhel9",
	"windows",
]

#AllPackages: [
	"moby-buildx",
	"moby-cli",
	"moby-compose",
	"moby-containerd",
	"moby-containerd-shim-systemd",
	"moby-engine",
	"moby-init",
	"moby-runc",
]

#Archive: archive.#Archive & {
	name:   #enumPackages
	kind:   archive.#enumPkgKind
	distro: #enumDistros
	kind:   _toPackageType[distro]
}

#File: archive.#File & {
	compress?: *false | bool
	isDir?:    *false | bool
}

[PACKAGE=#enumPackages]: [DISTRO=#enumDistros]: #Archive

[PACKAGE=#enumPackages]: [DISTRO=#enumDistros]: {
	name:   PACKAGE
	distro: DISTRO
}

[PACKAGE=#enumPackages]: [DISTRO=#enumLinuxDistros]: {
	provides: [PACKAGE, ...string]
	binaries: [string, ...string]
	description: !=""
	files: [#File, ...#File]
}

#exeRegex: =~".*exe$"

[PACKAGE=#enumWinPackages]: windows: {
	binaries: [#exeRegex, ...#exeRegex]
	runtimeDeps: []
	provides: [...string]
	replaces: []
	conflicts: []
}

objects: [ for v in objectSets for x in v {x.jammy}]

objectSets: [
	"moby-buildx",
	"moby-cli",
	"moby-compose",
	"moby-containerd",
	"moby-containerd-shim-systemd",
	"moby-engine",
	"moby-init",
	"moby-runc",
]
// objectSets: #AllPackages
