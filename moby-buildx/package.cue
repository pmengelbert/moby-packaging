package archive

buildx: [DISTRO=#enumDistros]: {
	webpage:     "https://github.com/docker/buildx"
	description: "A Docker CLI plugin for extended build capabilities with BuildKit"
}

buildx: [DISTRO=#enumLinuxDistros]: {
	binaries: [
		"/build/src/docker-buildx",
	]
	files: [
		{
			source: "/build/src/docker-buildx"
			dest:   "/usr/libexec/docker/cli-plugins/docker-buildx"
		},
		{
			source: "/build/legal/LICENSE"
			dest:   "/usr/share/doc/moby-buildx/LICENSE"
		},
		{
			source:   "/build/legal/NOTICE"
			dest:     "/usr/share/doc/moby-buildx/NOTICE.gz"
			compress: true
		},
	]
}

[PACKAGE=#enumWinPackages]: windows: binaries: []

[PACKAGE=#enumNonWinPackages]: windows: binaries: []
buildx: [DISTRO=#enumDebDistros]: {
	runtimeDeps: []
	recommends: [
		"moby-cli",
	]
	conflicts: [
		"docker-ce",
		"docker-ee",
	]
	replaces: []
	installScripts: []
}
buildx: [DISTRO=#enumRPMDistros]: {
	runtimeDeps: [
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
	recommends: []
	conflicts: [
		"docker-ce",
		"docker-ee",
	]
	replaces: []
	installScripts: []
}
for distro in #AllDistros {
	buildx: "\(distro)": {}
}
