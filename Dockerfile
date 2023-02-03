FROM mambaorg/micromamba:1.2.0
COPY --chown=$MAMBA_USER:$MAMBA_USER env.yaml /tmp/env.yaml
RUN micromamba install -y -n base -f /tmp/env.yaml && \
    micromamba clean --all --yes
ARG MAMBA_DOCKERFILE_ACTIVATE=1
COPY . /opt/app
WORKDIR /data
ENTRYPOINT ["/usr/local/bin/_entrypoint.sh", "python", "/opt/app/manage.py"]

