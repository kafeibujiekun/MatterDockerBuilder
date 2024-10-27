FROM ghcr.io/project-chip/chip-build:54

SHELL ["/bin/bash", "-c"]

RUN set -x \
    && cd /root \
    && git clone https://github.com/project-chip/connectedhomeip.git \
    && cd connectedhomeip \
    && ./scripts/checkout_submodules.py --shallow --platform  linux \
    && : # last line

RUN set -x \
    && cd /root/connectedhomeip \
    && source scripts/activate.sh \
    && : # last line

RUN set -x \
    && cd /root/connectedhomeip \
    && source scripts/activate.sh \
    && scripts/examples/gn_build_example.sh examples/chip-tool out/chip-tool/ \
    && : # last line

RUN set -x \
    && cd /root/connectedhomeip \
    && source scripts/activate.sh \
    && scripts/build_python.sh -m platform -i out/python_env \
    && : # last line
