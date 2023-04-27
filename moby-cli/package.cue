package packaging

"moby-cli": {
	name:     "moby-cli"
	webpage:  "https://github.com/docker/cli"
	makefile: "#moby-cli/Makefile"
	files: [{
		source: "/build/src/build/docker"
		dest:   "/usr/bin/docker"
	}, {
		source: "/build/src/contrib/completion/zsh/_docker"
		dest:   "/usr/share/zsh/vendor-completions/_docker"
	}, {
		source: "/build/legal/LICENSE"
		dest:   "/usr/share/doc/moby-cli/LICENSE"
	}, {
		source:   "/build/legal/NOTICE"
		dest:     "/usr/share/doc/moby-cli/NOTICE.gz"
		compress: true
	}, {
		source:   "/build/src/contrib/completion/bash/docker"
		dest:     "/usr/share/bash-completion/completions/docker"
		compress: true
	}]
	binaries: {
		rpm: [
			"/build/src/build/docker",
		]
		deb: [
			"/build/src/build/docker",
		]
		win: [
			"/build/src/build/docker.exe",
		]
	}
	recommends: deb: [
		"ca-certificates",
		"git",
		"moby-buildx",
		"pigz",
		"xz-utils",
	]
	suggests: deb: [
		"moby-engine",
	]
	conflicts: deb: [
		"docker",
		"docker-ce",
		"docker-ce-cli",
		"docker-ee",
		"docker-ee-cli",
		"docker-engine",
		"docker-engine-cs",
		"docker.io",
		"lxc-docker",
		"lxc-docker-virtual-package",
	]
	replaces: deb: [
		"docker",
		"docker-ce",
		"docker-ce-cli",
		"docker-ee",
		"docker-ee-cli",
		"docker-engine",
		"docker-engine-cs",
		"docker.io",
		"lxc-docker",
		"lxc-docker-virtual-package",
	]
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
	installScripts: {
		deb: [{
			when:   "post-install"
			script: "#moby-cli/postinstall/deb/postinst"
		}]
		rpm: [{
			when:   "post-install"
			script: "#moby-cli/postinstall/rpm/postinst"
		}]
	}
	description: """
		Docker container platform (client package)
		 Docker is a platform for developers and sysadmins to develop, ship, and run
		 applications. Docker lets you quickly assemble applications from components and
		 eliminates the friction that can come when shipping code. Docker lets you get
		 your code tested and deployed into production as fast as possible.
		 .
		 This package provides the \"docker\" client binary (and supporting files).
		"""
}
