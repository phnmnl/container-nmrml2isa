FROM ubuntu:16.04
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL version=0.1
LABEL software=nmrml2isa
LABEL software.version=0.3.0

RUN apt-get -y update && apt-get -y install --no-install-recommends python-pip && \
    pip install --upgrade pip && pip install -U setuptools && pip install six && \
    pip install nmrml2isa==0.3.0 && \
    pip uninstall -y pip && \
    apt-get purge -y python-pip && \
    apt-get install --no-install-recommends python && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV WRAPPER_REVISION 4c85371042feda978278498f25ae89d6582a5aee

RUN apt-get -y update && apt-get -y install --no-install-recommends curl zip && \
    curl https://raw.githubusercontent.com/ISA-tools/nmrml2isa-galaxy/$WRAPPER_REVISION/galaxy/nmrml2isa/wrapper.py -o /usr/local/bin/wrapper.py && \
    curl https://raw.githubusercontent.com/ISA-tools/nmrml2isa-galaxy/$WRAPPER_REVISION/galaxy/nmrml2isa/pub_role.loc -o /usr/local/bin/pub_role.loc && \
    curl https://raw.githubusercontent.com/ISA-tools/nmrml2isa-galaxy/$WRAPPER_REVISION/galaxy/nmrml2isa/pub_role.loc -o /usr/local/bin/pub_status.loc && \
    chmod a+x /usr/local/bin/wrapper.py && \
    apt-get purge -y curl && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD runTest1.sh /usr/local/bin/runTest1.sh
RUN chmod +x /usr/local/bin/runTest1.sh

ENTRYPOINT ["nmrml2isa"]
