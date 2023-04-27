package archive

"moby-compose": [DISTRO=#enumDistros]: {
	webpage:     "https://github.com/docker/compose-cli"
	description: "A Docker CLI plugin which allows you to run Docker Compose applications from the Docker CLI."
}
"moby-compose": [DISTRO=#enumLinuxKind]: {
	binaries: [
		"/build/src/bin/docker-compose",
	]
	runtimeDeps: [
		"moby-cli",
	]
	recommends: []
	conflicts: [
		"docker-ce",
		"docker-ee",
		"docker-ce-cli",
		"docker-ee-cli",
	]
	replaces: []
	provides: [...string]
	installScripts: []
}
"moby-compose": [DISTRO=#enumLinuxKind]: {
	binaries: [
		"/build/src/bin/docker-compose",
	]
	runtimeDeps: [
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
	recommends: []
	conflicts: [
		"docker-ce",
		"docker-ee",
	]
	replaces: []
	provides: [...string]
	installScripts: []
}
"moby-compose": {}
