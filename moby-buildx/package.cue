package packaging

"moby-buildx": {
	name:     "moby-buildx"
	webpage:  "https://github.com/docker/buildx"
	makefile: "#moby-buildx/Makefile"
	files: [{
		source: "/build/src/docker-buildx"
		dest:   "/usr/libexec/docker/cli-plugins/docker-buildx"
	}, {
		source: "/build/legal/LICENSE"
		dest:   "/usr/share/doc/moby-buildx/LICENSE"
	}, {
		source:   "/build/legal/NOTICE"
		dest:     "/usr/share/doc/moby-buildx/NOTICE.gz"
		compress: true
	}]
	binaries: {
		deb: [
			"/build/src/docker-buildx",
		]
		rpm: [
			"/build/src/docker-buildx",
		]
		win: []
	}
	recommends: deb: [
		"moby-cli",
	]
	conflicts: {
		deb: [
			"docker-ce",
			"docker-ee",
		]
		rpm: [
			"docker-ce",
			"docker-ee",
		]
	}
	runtimeDeps: rpm: [
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
	description: "A Docker CLI plugin for extended build capabilities with BuildKit"
}
