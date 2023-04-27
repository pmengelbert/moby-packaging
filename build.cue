package archive

import (
	"github.com/Azure/moby-packaging/pkg/archive"
)

_arch: "amd64" | "arm64" | "arm/v7"

#enumPackages: "moby-buildx" |
	"moby-cli" |
	"moby-compose" |
	"moby-containerd" |
	"moby-containerd-shim-systemd" |
	"moby-engine" |
	"moby-init" |
	"moby-runc"

#enumDistros: "bionic" |
	"bullseye" |
	"buster" |
	"centos7" |
	"focal" |
	"jammy" |
	"mariner2" |
	"rhel8" |
	"rhel9" |
	"windows"

#enumDebDistros: "bionic" | "bullseye" | "buster" | "focal" | "jammy"
#enumRPMDistros: "centos7" | "mariner2" | "rhel8" | "rhel9"

#enumLinuxKind:    archive.#PkgKindDeb | archive.#PkgKindRPM
#enumLinuxDistros: #enumDebDistros | #enumRPMDistros

#enumWinPackages:    "moby-engine" | "moby-containerd" | "moby-cli"
#enumNonWinPackages: "moby-buildx" | "moby-compose" | "moby-containerd-shim-systemd" | "moby-init" | "moby-runc"

_toPackageType: {
	bionic:   archive.#PkgKindDeb
	bullseye: archive.#PkgKindDeb
	buster:   archive.#PkgKindDeb
	focal:    archive.#PkgKindDeb
	jammy:    archive.#PkgKindDeb
	centos7:  archive.#PkgKindRPM
	mariner2: archive.#PkgKindRPM
	rhel8:    archive.#PkgKindRPM
	rhel9:    archive.#PkgKindRPM
	windows:  archive.#PkgKindWin
}

// Semver validation
#semver: =~#"^(?P<major>0|[1-9]\d*)\.(?P<minor>0|[1-9]\d*)\.(?P<patch>0|[1-9]\d*)(?:-(?P<prerelease>(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+(?P<buildmetadata>[0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$"#

let BuildSpec = archive.#Spec
#Spec: BuildSpec & {
	arch:     _arch
	commit:   =~"[0-9a-f]{40}"
	package:  #enumPackages
	repo:     =~"https://.*$"
	distro:   #enumDistros
	tag:      #semver
	revision: =~#"\d+"#
	_kind:    _toPackageType["\(distro)"]
}

#DebSpec: #Spec & {
	_kind: "deb"
}

#RPMSpec: #Spec & {
	_kind: "rpm"
}

#WinSpec: #Spec & {
	_kind: "win"
}
