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
	"buildx",
	"cli",
	"compose",
	"containerd",
	"shim",
	"engine",
	"init",
	"runc",
]

#fullName: {
	buildx:     "moby-buildx"
	cli:        "moby-cli"
	compose:    "moby-compose"
	containerd: "moby-containerd"
	shim:       "moby-containerd-shim-systemd"
	engine:     "moby-engine"
	init:       "moby-init"
	runc:       "moby-runc"
}

#Archive: archive.#Archive & {
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
	name:   #fullName[PACKAGE]
	distro: DISTRO
}

[PACKAGE=#enumPackages]: [DISTRO=#enumLinuxDistros]: {
	provides: [#fullName[PACKAGE], ...string]
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
