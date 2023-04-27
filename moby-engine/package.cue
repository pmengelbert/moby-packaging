package packaging

"moby-engine": {
	name:     "moby-engine"
	makefile: "#moby-engine/Makefile"
	webpage:  "https://github.com/moby/moby"
	files: [{
		source: "/build/systemd/docker.socket"
		dest:   "/lib/systemd/system/docker.socket"
	}, {
		source: "/build/src/contrib/nuke-graph-directory.sh"
		dest:   "/usr/share/moby-engine/contrib/nuke-graph-directory.sh"
	}, {
		source: "/build/src/contrib/check-config.sh"
		dest:   "/usr/share/moby-engine/contrib/check-config.sh"
	}, {
		source: "/build/bundles/dynbinary-daemon/dockerd"
		dest:   "/usr/bin/dockerd"
	}, {
		source: "/build/src/libnetwork/docker-proxy"
		dest:   "/usr/bin/docker-proxy"
	}, {
		source: "/build/src/contrib/udev/80-docker.rules"
		dest:   "/lib/udev/rules.d/80-moby-engine.rules"
	}, {
		source: ""
		dest:   "/etc/docker"
		isdir:  true
	}, {
		source: "/build/legal/LICENSE"
		dest:   "/usr/share/doc/moby-engine/LICENSE"
	}, {
		source:   "/build/legal/NOTICE"
		dest:     "/usr/share/doc/moby-engine/NOTICE.gz"
		compress: true
	}]
	systemd: [{
		source: "/build/systemd/docker.service"
		dest:   "/lib/systemd/system/docker.service"
	}]
	binaries: {
		deb: [
			"/build/bundles/dynbinary-daemon/dockerd",
			"/build/src/libnetwork/docker-proxy",
		]
		rpm: [
			"/build/bundles/dynbinary-daemon/dockerd",
			"/build/src/libnetwork/docker-proxy",
		]
		win: [
			"/build/src/bundles/binary-daemon/dockerd.exe",
		]
	}
	recommends: deb: [
		"apparmor",
		"ca-certificates",
		"iptables",
		"kmod",
		"moby-cli",
		"pigz",
		"xz-utils",
	]
	suggests: deb: [
		"aufs-tools",
		"cgroupfs-mount | cgroup-lite",
		"git",
	]
	conflicts: {
		deb: [
			"docker",
			"docker-ce",
			"docker-ee",
			"docker-engine",
			"docker-engine-cs",
			"docker.io",
			"lxc-docker",
			"lxc-docker-virtual-package",
		]
		rpm: [
			"docker",
			"docker-io",
			"docker-engine-cs",
			"docker-ee",
		]
	}
	replaces: deb: [
		"docker",
		"docker-ce",
		"docker-ee",
		"docker-engine",
		"docker-engine-cs",
		"docker.io",
		"lxc-docker",
		"lxc-docker-virtual-package",
	]
	provides: {}
	runtimeDeps: {
		deb: [
			"moby-containerd (>= 1.4.3)",
			"moby-runc (>= 1.0.2)",
			"moby-init (>= 0.19.0)",
		]
		rpm: [
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
	}
	installScripts: {
		deb: [{
			when:   "post-install"
			script: "#moby-engine/postinstall/deb/postinstall"
		}, {
			when:   "pre-removal"
			script: "#moby-engine/postinstall/deb/prerm"
		}, {
			when:   "post-removal"
			script: "#moby-engine/postinstall/deb/postrm"
		}]
		rpm: [{
			when:   "post-install"
			script: "#moby-engine/postinstall/rpm/postinstall"
		}, {
			when:   "pre-removal"
			script: "#moby-engine/postinstall/rpm/prerm"
		}, {
			when:   "post-upgrade"
			script: "#moby-engine/postinstall/rpm/upgrade"
		}]
	}
	description: """
		Docker container platform (engine package)
		  Moby is an open-source project created by Docker to enable and accelerate software containerization.
		"""
}
