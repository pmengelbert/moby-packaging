package packaging

"moby-runc": {
	name:    "moby-runc"
	webpage: "https://github.com/opencontainers/runc"
	files: [{
		source: "/build/src/runc"
		dest:   "/usr/bin/runc"
	}, {
		source: "/build/src/contrib/completions/bash/runc"
		dest:   "/usr/share/bash-completion/completions/runc"
	}, {
		source:   "/build/man"
		dest:     "/usr/share/man"
		isdir:    true
		compress: true
	}, {
		source: "/build/legal/LICENSE"
		dest:   "/usr/share/doc/moby-runc/LICENSE"
	}, {
		source:   "/build/legal/NOTICE"
		dest:     "/usr/share/doc/moby-runc/NOTICE.gz"
		compress: true
	}]
	binaries: {
		deb: [
			"/build/src/runc",
		]
		rpm: [
			"/build/src/runc",
		]
		win: []
	}
	suggests: deb: [
		"moby-containerd",
	]
	conflicts: {
		deb: [
			"runc",
			"moby-engine (<= 3.0.10)",
		]
		rpm: [
			"runc",
			"runc-io",
		]
	}
	replaces: deb: [
		"runc",
	]
	provides: deb: [
		"runc",
	]
	runtimeDeps: rpm: [
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
	description: """
		CLI tool for spawning and running containers according to the OCI specification
		  runc is a CLI tool for spawning and running containers according to the OCI
		  specification.
		"""
}
