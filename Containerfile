# syntax=docker/dockerfile:1.4
FROM ruby:3.1-slim

# ---- System deps ----
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential git nodejs \
    && rm -rf /var/lib/apt/lists/*

# ---- Stable Gemfile layer ----
# Gems will install here, isolated from /site
WORKDIR /bundle_base
COPY Gemfile Gemfile.lock* ./
RUN gem install bundler && \
    bundle config set --local path '/usr/local/bundle' && \
    bundle install

# ---- Runtime working directory ----
WORKDIR /site

RUN useradd -m dev
USER 1000:1000

CMD ["jekyll", "serve", "--livereload", "--host", "0.0.0.0"]
