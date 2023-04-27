package archive

"moby-containerd-shim-systemd": [DISTRO=#enumDistros]: {
	webpage:     "https://github.com/cpuguy83/containerd-shim-systemd-v1"
	description: "A containerd shim runtime that uses systemd to monitor runc containers"
}
"moby-containerd-shim-systemd": [DISTRO=#enumLinuxKind]: {
	binaries: [
		"/build/src/bin/containerd-shim-systemd-v1",
	]
	runtimeDeps: [
		"systemd (>= 239)",
		"moby-containerd (>= 1.6)",
	]
	recommends: [
		"moby-runc",
	]
	conflicts: []
	replaces: []
	provides: []
	installScripts: [
		{
			when:   "post-install"
			script: "#moby-containerd-shim-systemd/postinstall/deb/postinst"
		},
		{
			when:   "pre-removal"
			script: "#moby-containerd-shim-systemd/postinstall/deb/prerm"
		},
		{
			when:   "post-removal"
			script: "#moby-containerd-shim-systemd/postinstall/deb/postrm"
		},
	]
}
"moby-containerd-shim-systemd": [DISTRO=#enumLinuxKind]: {
	binaries: [
		"/build/src/bin/containerd-shim-systemd-v1",
	]
	runtimeDeps: [
		"/bin/sh",
		"container-selinux >= 2:2.95",
		"device-mapper-libs >= 1.02.90-1",
		"iptables",
		"libcgroup",
		"moby-containerd >= 1.3.9",
		"moby-containerd >= 1.6, systemd => 239",
		"moby-runc >= 1.0.2",
		"systemd-units",
		"tar",
		"xz",
	]
	recommends: []
	conflicts: []
	replaces: []
	provides: []
	installScripts: []
}
"moby-containerd-shim-systemd": {}
