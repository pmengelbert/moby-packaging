package archive

import (
	"github.com/Azure/moby-packaging/pkg/archive"
)

#deb: "deb"
#rpm: "rpm"
#win: "win"

_packageType: #deb | #rpm | #win

_arch: "amd64" | "arm64" | "arm/v7"

_packages: "moby-buildx" |
	"moby-cli" |
	"moby-compose" |
	"moby-containerd" |
	"moby-containerd-shim-systemd" |
	"moby-engine" |
	"moby-init" |
	"moby-runc"

_distros: "bionic" |
	"bullseye" |
	"buster" |
	"centos7" |
	"focal" |
	"jammy" |
	"mariner2" |
	"rhel8" |
	"rhel9" |
	"windows"

_toPackageType: {
	bionic:   #deb
	bullseye: #deb
	buster:   #deb
	focal:    #deb
	jammy:    #deb
	centos7:  #rpm
	mariner2: #rpm
	rhel8:    #rpm
	rhel9:    #rpm
	windows:  #win
}

// Semver validation
#semver: =~#"^(?P<major>0|[1-9]\d*)\.(?P<minor>0|[1-9]\d*)\.(?P<patch>0|[1-9]\d*)(?:-(?P<prerelease>(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+(?P<buildmetadata>[0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$"#

let BuildSpec = archive.#Spec
#Spec: BuildSpec & {
	arch:     _arch
	commit:   =~"[0-9a-f]{40}"
	package:  _packages
	repo:     =~"https://.*$"
	distro:   _distros
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
