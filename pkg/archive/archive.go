package archive

type PkgKind string
type PkgKindMap map[PkgKind][]string
type PkgAction int
type PkgInstallMap map[PkgKind][]InstallScript

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
	PkgActionPreRemoval PkgAction = iota
	PkgActionPostRemoval
	PkgActionPostInstall
	PkgActionUpgrade
)

type InstallScript struct {
	When   PkgAction
	Script string
}

type Archive struct {
	Name    string    `json:"name"`
	Kind    string    `json:"kind"`
	Distro  string    `json:"distro"`
	Webpage string    `json:"webpage"`
	Files   []File    `json:"files"`
	Systemd []Systemd `json:"systemd"`
	// list of filenames
	Postinst []string `json:"postinst"`
	// required for debian dependency resolution
	Binaries       []string      `json:"binaries"`
	WinBinaries    []string      `json:"winBinaries"`
	Recommends     PkgKindMap    `json:"recommends"`
	Suggests       PkgKindMap    `json:"suggests"`
	Conflicts      PkgKindMap    `json:"conflicts"`
	Replaces       PkgKindMap    `json:"replaces"`
	Provides       PkgKindMap    `json:"provides"`
	BuildDeps      PkgKindMap    `json:"buildDeps"`
	RuntimeDeps    []string      `json:"runtimeDeps"`
	InstallScripts PkgInstallMap `json:"installScripts"`
	Description    string        `json:"description"`
}
