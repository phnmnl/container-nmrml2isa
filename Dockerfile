FROM ubuntu:16.04

MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

ENV TOOL_NAME=nmrml2isa
ENV TOOL_VERSION=1.1.0
ENV CONTAINER_VERSION=0.3
ENV CONTAINER_GITHUB="https://github.com/isa-tools/nmrml2isa"

LABEL maintainer="PhenoMeNal-H2020 Project (phenomenal-h2020-users@googlegroups.com)"
LABEL version=
LABEL software=
LABEL version="${CONTAINER_VERSION}"
LABEL software.version="${TOOL_VERSION}"
LABEL description="Creates ISA metadata files based on a collection of nmrML files."
LABEL website="${CONTAINER_GITHUB}"
LABEL documentation="https://github.com/isa-tools/nmrml2isa-galaxy"
LABEL license="https://github.com/ISA-tools/nmrml2isa/blob/master/LICENSE"
LABEL tags="Metabolomics"

ENV WRAPPER_REVISION 4c85371042feda978278498f25ae89d6582a5aee

RUN apt-get -y update && apt-get -y install --no-install-recommends python python-setuptools python-pip git unzip && \
    pip install nmrml2isa==0.3.0 && \
    git clone --depth 1 --recursive --single-branch -b v${TOOL_VERSION} https://github.com/pkrog/nmrml2isa-galaxy /files/nmrml2isa-galaxy && \
    apt-get purge -y git python-pip python-setuptools && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Make tool accessible through PATH
ENV PATH=$PATH:/files/nmrml2isa-galaxy/galaxy/nmrml2isa
RUN chmod u+x "/files/nmrml2isa-galaxy/galaxy/nmrml2isa/wrapper.py"

# Make test script accessible through PATH
RUN echo "#!/bin/bash" >/files/test-nmrml2isa
RUN echo "cd /files/nmrml2isa-galaxy/test" >>/files/test-nmrml2isa
RUN echo "testthat.sh test-wrapper.sh" >>/files/test-nmrml2isa
RUN chmod u+x "/files/test-nmrml2isa"
ENV PATH=$PATH:/files:/files/nmrml2isa-galaxy/bash-testthat

ENTRYPOINT ["/files/nmrml2isa-galaxy/galaxy/nmrml2isa/wrapper.py"]
