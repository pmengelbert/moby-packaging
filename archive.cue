package archive

import (
	"github.com/Azure/moby-packaging/pkg/archive"
	// "strings"
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

#distroMetadata: {
	for x in #AllDistros {
		"\(x)": #Archive & {
			kind:   _toPackageType[x]
			distro: x
		}
	}
}

#Archive: archive.#Archive & {
	name:        _packages
	kind:        _packageType
	distro:      _distros
	description: !=""
	binaries: [string, ...string]
	// runtimeDeps: {
	// 	"_\(kind)": [...string]
	// }
}

// #DebArchive: #Archive & {kind: #deb}
// #RPMArchive: #Archive & {kind: #rpm}
// #WinArchive: #Archive & {kind: #win}

// #Jammy: #DebArchive & {distro: "jammy"}

#File: archive.#File & {
	compress?: *false | bool
	isDir?:    *false | bool
}

_containerd: #Archive & {
	description: """
		Industry-standard container runtime
		 containerd is an industry-standard container runtime with an emphasis on
		 simplicity, robustness and portability. It is available as a daemon for Linux
		 and Windows, which can manage the complete container lifecycle of its host
		 system: image transfer and storage, container execution and supervision,
		 low-level storage and network attachments, etc.
		 .
		 containerd is designed to be embedded into a larger system, rather than being
		 used directly by developers or end-users.

		"""
	webpage: "https://github.com/containerd/containerd"
	files:   [...#File] & [
			{source: "/build/src/bin", dest:       "usr/bin"},
			{source: "/build/man", dest:           "/usr/share/man"},
			{source: "/build/legal/LICENSE", dest: "/usr/share/doc/moby-containerd/LICENSE"},
			{source: "/build/legal/NOTICE", dest:  "/usr/share/doc/moby-containerd/NOTICE.gz", compress: true},
	]
}

[PACKAGE=_packages]: [DISTRO=_distros]: _containerd & #distroMetadata[DISTRO] & {
	if DISTRO != "windows" {
		binaries: [
			"/build/src/bin/containerd",
			"/build/src/bin/containerd-shim",
			"/build/src/bin/containerd-shim-runc-v1",
			"/build/src/bin/containerd-shim-runc-v2",
			"/build/src/bin/containerd-stress",
		]
	}
}

#exeRegex: =~".*exe$"

[PACKAGE=_packages]: [DISTRO=_distros]: #Archive & #distroMetadata[DISTRO] & {
	name: PACKAGE
}

[PACKAGE=_packages]: windows: #distroMetadata.windows & {
	binaries: [#exeRegex, ...#exeRegex]
}

"moby-containerd": windows: binaries: ["x.exe"]

// for package in ["moby-containerd"] {
// 	for distro in ["jammy", "bionic"] {
// 		let trimmed = strings.TrimPrefix(package, "moby-")
// 		"\(trimmed)": "\(distro)": {
// 			name: package
// 		}
// 	}
// }

"moby-containerd": jammy: runtimeDeps: [
	"aaa",
	"bbb",
]

// containerd: jammy: _containerd & #distroMetadata.jammy & {}

// continerd: jammy: {}
