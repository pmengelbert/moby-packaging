package packaging

"moby-containerd-shim-systemd": {
	name:     "moby-containerd-shim-systemd"
	webpage:  "https://github.com/cpuguy83/containerd-shim-systemd-v1"
	makefile: "#moby-containerd-shim-systemd/Makefile"
	files: [{
		source: "/build/src/bin/containerd-shim-systemd-v1"
		dest:   "/usr/bin/containerd-shim-systemd-v1"
	}, {
		source: "/build/systemd/containerd-shim-systemd-v1.socket"
		dest:   "/lib/systemd/system/containerd-shim-systemd-v1.socket"
	}, {
		source: "/build/legal/LICENSE"
		dest:   "/usr/share/doc/moby-containerd-shim-systemd/LICENSE"
	}, {
		source:   "/build/legal/NOTICE"
		dest:     "/usr/share/doc/moby-containerd-shim-systemd/NOTICE.gz"
		compress: true
	}]
	systemd: [{
		source: "/build/systemd/containerd-shim-systemd-v1.service"
		dest:   "/lib/systemd/system/containerd-shim-systemd-v1.service"
	}]
	binaries: {
		deb: [
			"/build/src/bin/containerd-shim-systemd-v1",
		]
		rpm: [
			"/build/src/bin/containerd-shim-systemd-v1",
		]
		win: []
	}
	recommends: deb: [
		"moby-runc",
	]
	runtimeDeps: {
		deb: [
			"systemd (>= 239)",
			"moby-containerd (>= 1.6)",
		]
		rpm: [
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
	}
	installScripts: deb: [{
		when:   "post-install"
		script: "#moby-containerd-shim-systemd/postinstall/deb/postinst"
	}, {
		when:   "pre-removal"
		script: "#moby-containerd-shim-systemd/postinstall/deb/prerm"
	}, {
		when:   "post-removal"
		script: "#moby-containerd-shim-systemd/postinstall/deb/postrm"
	}]
	description: "A containerd shim runtime that uses systemd to monitor runc containers"
}
