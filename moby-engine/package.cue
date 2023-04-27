package archive

"moby-engine": [DISTRO=#enumDistros]: {
	webpage:     "https://github.com/moby/moby"
	description: "Docker container platform (engine package)\n  Moby is an open-source project created by Docker to enable and accelerate software containerization."
}
"moby-engine": [DISTRO=#enumLinuxKind]: {
	binaries: [
		"/build/bundles/dynbinary-daemon/dockerd",
		"/build/src/libnetwork/docker-proxy",
	]
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
	provides: []
	installScripts: [
		{
			when:   "post-install"
			script: "#moby-engine/postinstall/deb/postinstall"
		},
		{
			when:   "pre-removal"
			script: "#moby-engine/postinstall/deb/prerm"
		},
		{
			when:   "post-removal"
			script: "#moby-engine/postinstall/deb/postrm"
		},
	]
}
"moby-engine": [DISTRO=#enumLinuxKind]: {
	binaries: [
		"/build/bundles/dynbinary-daemon/dockerd",
		"/build/src/libnetwork/docker-proxy",
	]
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
	provides: []
	installScripts: [
		{
			when:   "post-install"
			script: "#moby-engine/postinstall/rpm/postinstall"
		},
		{
			when:   "pre-removal"
			script: "#moby-engine/postinstall/rpm/prerm"
		},
		{
			when:   "post-upgrade"
			script: "#moby-engine/postinstall/rpm/upgrade"
		},
	]
}
"moby-engine": windows: binaries: [
	"/build/src/bundles/binary-daemon/dockerd.exe",
]
