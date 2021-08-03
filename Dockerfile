FROM gentoo/portage:latest as portage
FROM gentoo/stage3:latest as gentoo

MAINTAINER Tobias Gruetzmacher "tobias-docker@23.gs"

ARG BUILD_DATE
ARG VCS_REF
LABEL \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.license="MIT" \
  org.label-schema.name="MIPS R5900 (PS2) Toolchain" \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.vcs-url="https://github.com/TobiX/mipsr5900el-toolchain"

COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo

COPY crossdev.conf /etc/portage/repos.conf/

RUN \
	mkdir -p /var/db/repos/localrepo-crossdev/{profiles,metadata} && \
	echo 'crossdev' > /var/db/repos/localrepo-crossdev/profiles/repo_name && \
	echo 'masters = gentoo' > /var/db/repos/localrepo-crossdev/metadata/layout.conf && \
	chown -R portage:portage /var/db/repos/localrepo-crossdev && \
	emerge bc crossdev dev-vcs/git && \
	crossdev --stage4 --target mipsr5900el-unknown-linux-gnu && \
	rm /var/cache/distfiles/*

ENV ARCH=mips CROSS_COMPILE=mipsr5900el-unknown-linux-gnu-
