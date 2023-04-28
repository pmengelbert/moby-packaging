package archive

objects: [ for v in objectSets for x in v {x}]

objectSets: [
	buildx,
	cli,
	compose,
	containerd,
	shim,
	engine,
	init,
	runc,
]
