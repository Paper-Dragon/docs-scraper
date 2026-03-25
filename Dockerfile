FROM python:3.14-slim

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PIP_NO_CACHE_DIR=1

WORKDIR /docs-scraper

RUN : \
  && apt-get update -y \
  && apt-get install -y --no-install-recommends \
  libnss3 \
  chromium-driver \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY . .
RUN pip install --upgrade pip \
  && pip install --no-cache-dir .
