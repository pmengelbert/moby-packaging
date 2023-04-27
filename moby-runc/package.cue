package archive

"moby-runc": [DISTRO=#enumDistros]: {
	webpage:     "https://github.com/opencontainers/runc"
	description: "CLI tool for spawning and running containers according to the OCI specification\n  runc is a CLI tool for spawning and running containers according to the OCI\n  specification."
}
"moby-runc": [DISTRO=#enumLinuxKind]: {
	binaries: [
		"/build/src/runc",
	]
	runtimeDeps: []
	recommends: []
	conflicts: [
		"runc",
		"moby-engine (<= 3.0.10)",
	]
	replaces: [
		"runc",
	]
	provides: [
		"runc",
	]
	installScripts: []
}
"moby-runc": [DISTRO=#enumLinuxKind]: {
	binaries: [
		"/build/src/runc",
	]
	runtimeDeps: [
		"/bin/sh",
		"container-selinux >= 2:2.95",
		"device-mapper-libs >= 1.02.90-1",
		"iptables",
		"libcgroup",
		"libseccomp >= 2.3",
		"moby-containerd >= 1.3.9",
		"moby-runc >= 1.0.2",
		"systemd-units",
		"tar",
		"xz",
	]
	recommends: []
	conflicts: [
		"runc",
		"runc-io",
	]
	replaces: []
	provides: []
	installScripts: []
}
"moby-runc": {}
