package archive

engine: [DISTRO=#enumDistros]: {
	webpage:     "https://github.com/moby/moby"
	description: "Docker container platform (engine package)\n  Moby is an open-source project created by Docker to enable and accelerate software containerization."
}

engine: [DISTRO=#enumLinuxDistros]: {
	binaries: [
		"/build/bundles/dynbinary-daemon/dockerd",
		"/build/src/libnetwork/docker-proxy",
	]
	files: [
		{
			source: "/build/systemd/docker.socket"
			dest:   "/lib/systemd/system/docker.socket"
		},
		{
			source: "/build/src/contrib/nuke-graph-directory.sh"
			dest:   "/usr/share/moby-engine/contrib/nuke-graph-directory.sh"
		},
		{
			source: "/build/src/contrib/check-config.sh"
			dest:   "/usr/share/moby-engine/contrib/check-config.sh"
		},
		{
			source: "/build/bundles/dynbinary-daemon/dockerd"
			dest:   "/usr/bin/dockerd"
		},
		{
			source: "/build/src/libnetwork/docker-proxy"
			dest:   "/usr/bin/docker-proxy"
		},
		{
			source: "/build/src/contrib/udev/80-docker.rules"
			dest:   "/lib/udev/rules.d/80-moby-engine.rules"
		},
		{
			source: ""
			dest:   "/etc/docker"
			isDir:  true
		},
		{
			source: "/build/legal/LICENSE"
			dest:   "/usr/share/doc/moby-engine/LICENSE"
		},
		{
			source:   "/build/legal/NOTICE"
			dest:     "/usr/share/doc/moby-engine/NOTICE.gz"
			compress: true
		},
	]
}

[PACKAGE=#enumWinPackages]: windows: binaries: [
	"/build/src/bundles/binary-daemon/dockerd.exe",
]

[PACKAGE=#enumNonWinPackages]: windows: binaries: []
engine: [DISTRO=#enumDebDistros]: {
	runtimeDeps: [
		"moby-containerd (>= 1.4.3)",
		"moby-runc (>= 1.0.2)",
		"moby-init (>= 0.19.0)",
	]
	recommends: [
		"apparmor",
		"ca-certificates",
		"iptables",
		"kmod",
		"moby-cli",
		"pigz",
		"xz-utils",
	]
	conflicts: [
		"docker",
		"docker-ce",
		"docker-ee",
		"docker-engine",
		"docker-engine-cs",
		"docker.io",
		"lxc-docker",
		"lxc-docker-virtual-package",
	]
	replaces: [
		"docker",
		"docker-ce",
		"docker-ee",
		"docker-engine",
		"docker-engine-cs",
		"docker.io",
		"lxc-docker",
		"lxc-docker-virtual-package",
	]
	installScripts: [
		{
			when:   "postinstall"
			script: "moby-engine/postinstall/deb/postinstall"
		},
		{
			when:   "prerm"
			script: "moby-engine/postinstall/deb/prerm"
		},
		{
			when:   "postrm"
			script: "moby-engine/postinstall/deb/postrm"
		},
	]
}
engine: [DISTRO=#enumRPMDistros]: {
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
		"xz",
	]
	recommends: []
	conflicts: [
		"docker",
		"docker-io",
		"docker-engine-cs",
		"docker-ee",
	]
	replaces: []
	installScripts: [
		{
			when:   "postinstall"
			script: "moby-engine/postinstall/rpm/postinstall"
		},
		{
			when:   "prerm"
			script: "moby-engine/postinstall/rpm/prerm"
		},
		{
			when:   "upgrade"
			script: "moby-engine/postinstall/rpm/upgrade"
		},
	]
}
for distro in #AllDistros {
	engine: "\(distro)": {}
}
