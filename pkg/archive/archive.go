package archive

type PkgKind string
type PkgAction string

const (
	PkgKindDeb PkgKind = "deb"
	PkgKindRPM PkgKind = "rpm"
	PkgKindWin PkgKind = "win"
)

const (
	flagPostInstall     = "--after-install"
	flagUpgrade         = "--after-upgrade"
	flagPreRm           = "--before-remove"
	flagPostRm          = "--after-remove"
	filenamePostInstall = "postinst"
	filenamePostUpgrade = "postup"
	filenamePreRm       = "prerm"
	filenamePostRm      = "postrm"
)

const (
	PkgActionPreRemoval  PkgAction = "prerm"
	PkgActionPostRemoval PkgAction = "postrm"
	PkgActionPostInstall PkgAction = "postinstall"
	PkgActionUpgrade     PkgAction = "upgrade"
)

type InstallScript struct {
	When   PkgAction `json:"when"`
	Script string    `json:"script"`
}

type Archive struct {
	Name    string    `json:"name"`
	Kind    string    `json:"kind"`
	Distro  string    `json:"distro"`
	Webpage string    `json:"webpage"`
	Files   []File    `json:"files"`
	Systemd []Systemd `json:"systemd"`
	// required for debian dependency resolution
	Binaries       []string        `json:"binaries"`
	Recommends     []string        `json:"recommends"`
	Suggests       []string        `json:"suggests"`
	Conflicts      []string        `json:"conflicts"`
	Replaces       []string        `json:"replaces"`
	Provides       []string        `json:"provides"`
	BuildDeps      []string        `json:"buildDeps"`
	RuntimeDeps    []string        `json:"runtimeDeps"`
	InstallScripts []InstallScript `json:"installScripts"`
	Description    string          `json:"description"`
}
