package packaging

"moby-containerd": {
	name:        "moby-containerd"
	webpage:     "https://github.com/containerd/containerd"
	description: "#moby-containerd/description"
	makefile:    "#moby-containerd/Makefile"
	files: [{
		source: "/build/src/bin"
		dest:   "/usr/bin"
	}, {
		source: "/build/man"
		dest:   "/usr/share/man"
	}, {
		source: "/build/legal/LICENSE"
		dest:   "/usr/share/doc/moby-containerd/LICENSE"
	}, {
		source:   "/build/legal/NOTICE"
		dest:     "/usr/share/doc/moby-containerd/NOTICE.gz"
		compress: true
	}]
	systemd: [{
		source: "/build/src/containerd.service"
		dest:   "/lib/systemd/system/containerd.service"
	}]
	binaries: {
		deb: [
			"/build/src/bin/containerd",
			"/build/src/bin/containerd-shim",
			"/build/src/bin/containerd-shim-runc-v1",
			"/build/src/bin/containerd-shim-runc-v2",
			"/build/src/bin/containerd-stress",
		]
		rpm: [
			"/build/src/bin/containerd",
			"/build/src/bin/containerd-shim",
			"/build/src/bin/containerd-shim-runc-v1",
			"/build/src/bin/containerd-shim-runc-v2",
			"/build/src/bin/containerd-stress",
		]
		win: [
			"/build/src/bin/containerd.exe",
			"/build/hcs-shim/bin/containerd-shim-runhcs-v1.exe",
			"/build/src/bin/ctr.exe",
		]
	}
	runtimeDeps: {
		rpm: [
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
		deb: [
			"moby-runc (>= 1.0.2)",
		]
	}
	recommends: deb: [
		"ca-certificates",
	]
	conflicts: {
		deb: [
			"containerd",
			"containerd.io",
			"moby-engine (<= 3.0.12)",
		]
		rpm: [
			"containerd",
			"containerd-io",
			"moby-engine <= 3.0.11",
		]
	}
	replaces: deb: [
		"containerd",
		"containerd.io",
	]
	provides: deb: [
		"containerd",
		"containerd.io",
	]
	installScripts: {
		rpm: [{
			when:   "post-install"
			script: "#moby-containerd/postinstall/rpm/postinstall"
		}, {
			when:   "pre-removal"
			script: "#moby-containerd/postinstall/rpm/prerm"
		}, {
			when:   "post-upgrade"
			script: "#moby-containerd/postinstall/rpm/upgrade"
		}]
		deb: [{
			when:   "post-install"
			script: "#moby-containerd/postinstall/deb/postinstall"
		}, {
			when:   "pre-removal"
			script: "#moby-containerd/postinstall/deb/prerm"
		}, {
			when:   "post-removal"
			script: "#moby-containerd/postinstall/deb/postrm"
		}]
	}
}
