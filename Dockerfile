FROM docker.uclv.cu/python:3.9-alpine as python-image

RUN python -m venv --copies /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .

RUN pip install -r requirements.txt

FROM nvim:base

COPY --from=python-image /opt/venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"
