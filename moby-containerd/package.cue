package archive

"moby-containerd": [DISTRO=#enumDistros]: {
	webpage:     "https://github.com/containerd/containerd"
	description: "Industry-standard container runtime\n containerd is an industry-standard container runtime with an emphasis on\n simplicity, robustness and portability. It is available as a daemon for Linux\n and Windows, which can manage the complete container lifecycle of its host\n system: image transfer and storage, container execution and supervision,\n low-level storage and network attachments, etc.\n .\n containerd is designed to be embedded into a larger system, rather than being\n used directly by developers or end-users.\n"
}

"moby-containerd": [DISTRO=#enumLinuxDistros]: {
	binaries: [
		"/build/src/bin/containerd",
		"/build/src/bin/containerd-shim",
		"/build/src/bin/containerd-shim-runc-v1",
		"/build/src/bin/containerd-shim-runc-v2",
		"/build/src/bin/containerd-stress",
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
		"containerd",
		"containerd-io",
		"moby-engine <= 3.0.11",
	]
	replaces: []
	provides: []
	installScripts: [
		{
			when:   "post-install"
			script: "#moby-containerd/postinstall/rpm/postinstall"
		},
		{
			when:   "pre-removal"
			script: "#moby-containerd/postinstall/rpm/prerm"
		},
		{
			when:   "post-upgrade"
			script: "#moby-containerd/postinstall/rpm/upgrade"
		},
	]
}

"moby-containerd": windows: binaries: [
	"/build/src/bin/containerd.exe",
	"/build/hcs-shim/bin/containerd-shim-runhcs-v1.exe",
	"/build/src/bin/ctr.exe",
]

for distro in #AllDistros {
	"moby-containerd": "\(distro)": {}
}
