# version
DMD_VER = 2.109.0

# dirs
DISTR = ~/distr

# tool
CURL = curl -L -o
DUB  = /usr/bin/dub

# package
DMD_DEB = dmd_$(DMD_VER)-0_amd64.deb

# install
.PHONY: install update gz ref
install: gz ref $(DUB)
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -uy `cat apt.txt`
gz: \
	$(DISTR)/Linux/tools/$(DMD_DEB)
ref:

$(DUB): $(DISTR)/Linux/tools/$(DMD_DEB)
	sudo dpkg -i $< && sudo touch $@
$(DISTR)/Linux/tools/$(DMD_DEB):
	$(CURL) $@ https://downloads.dlang.org/releases/2.x/$(DMD_VER)/$(DMD_DEB)
