package packaging

"moby-init": {
	name:     "moby-init"
	webpage:  "https://github.com/krallin/tini"
	makefile: "#moby-init/Makefile"
	files: [{
		source: "/build/src/build/tini-static"
		dest:   "usr/bin/docker-init"
	}, {
		source: "/build/legal/LICENSE"
		dest:   "/usr/share/doc/moby-init/LICENSE"
	}, {
		source:   "/build/legal/NOTICE"
		dest:     "/usr/share/doc/moby-init/NOTICE.gz"
		compress: true
	}]
	binaries: {
		deb: [
			"/build/src/build/tini-static",
		]
		rpm: [
			"/build/src/build/tini-static",
		]
		win: []
	}
	conflicts: deb: [
		"tini",
	]
	replaces: deb: [
		"tini",
	]
	description: """
		tiny but valid init for containers
		 Tini is the simplest init you could think of.
		 .
		 All Tini does is spawn a single child (Tini is meant to be run in a
		 container), and wait for it to exit all the while reaping zombies and
		 performing signal forwarding.
		"""
}
