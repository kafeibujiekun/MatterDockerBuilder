FROM ghcr.io/project-chip/chip-build:54

RUN set -x \
    && cd /root \
    && git clone https://github.com/project-chip/connectedhomeip.git \
    && cd connectedhomeip \
    && ./scripts/checkout_submodules.py --shallow --platform  linux \
    && : # last line
