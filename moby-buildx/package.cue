package archive

"moby-buildx": [DISTRO=#enumDistros]: {
	webpage:     "https://github.com/docker/buildx"
	description: "A Docker CLI plugin for extended build capabilities with BuildKit"
}
"moby-buildx": [DISTRO=#enumLinuxKind]: {
	binaries: [
		"/build/src/docker-buildx",
	]
	runtimeDeps: []
	recommends: [
		"moby-cli",
	]
	conflicts: [
		"docker-ce",
		"docker-ee",
	]
	replaces: []
	provides: []
	installScripts: []
}
"moby-buildx": [DISTRO=#enumLinuxKind]: {
	binaries: [
		"/build/src/docker-buildx",
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
		"docker-ce",
		"docker-ee",
	]
	replaces: []
	provides: []
	installScripts: []
}
"moby-buildx": {}
