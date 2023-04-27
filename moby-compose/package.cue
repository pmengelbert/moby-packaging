package packaging

"moby-compose": {
	name:    "moby-compose"
	webpage: "https://github.com/docker/compose-cli"
	files: [{
		source: "/build/src/bin/docker-compose"
		dest:   "/usr/libexec/docker/cli-plugins/docker-compose"
	}, {
		source: "/build/legal/LICENSE"
		dest:   "/usr/share/doc/moby-compose/LICENSE"
	}, {
		source:   "/build/legal/NOTICE"
		dest:     "/usr/share/doc/moby-compose/NOTICE.gz"
		compress: true
	}]
	binaries: {
		deb: [
			"/build/src/bin/docker-compose",
		]
		rpm: [
			"/build/src/bin/docker-compose",
		]
		win: []
	}
	conflicts: {
		deb: [
			"docker-ce",
			"docker-ee",
			"docker-ce-cli",
			"docker-ee-cli",
		]
		rpm: [
			"docker-ce",
			"docker-ee",
		]
	}
	runtimeDeps: {
		deb: [
			"moby-cli",
		]
		rpm: [
			"/bin/sh",
			"container-selinux >= 2:2.95",
			"device-mapper-libs >= 1.02.90-1",
			"iptables",
			"libcgroup",
			"moby-cli",
			"moby-containerd >= 1.3.9",
			"moby-runc >= 1.0.2",
			"systemd-units",
			"tar",
			"xz",
		]
	}
	description: "A Docker CLI plugin which allows you to run Docker Compose applications from the Docker CLI."
}
