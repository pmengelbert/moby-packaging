package archive

"moby-init": [DISTRO=#enumDistros]: {
	webpage:     "https://github.com/krallin/tini"
	description: "tiny but valid init for containers\n Tini is the simplest init you could think of.\n .\n All Tini does is spawn a single child (Tini is meant to be run in a\n container), and wait for it to exit all the while reaping zombies and\n performing signal forwarding."
}
"moby-init": [DISTRO=#enumLinuxKind]: {
	binaries: [
		"/build/src/build/tini-static",
	]
	runtimeDeps: []
	recommends: []
	conflicts: [
		"tini",
	]
	replaces: [
		"tini",
	]
	provides: []
	installScripts: []
}
"moby-init": [DISTRO=#enumLinuxKind]: {
	binaries: [
		"/build/src/build/tini-static",
	]
	runtimeDeps: []
	recommends: []
	conflicts: []
	replaces: []
	provides: []
	installScripts: []
}
"moby-init": {}
