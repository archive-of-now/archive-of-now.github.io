# Match GitHub Actions environment
FROM ruby:3.1-slim

# Install build dependencies for common Jekyll plugins
RUN apt-get update && apt-get install -y --no-install-recommends \
      build-essential \
      git \
      libffi-dev \
      zlib1g-dev \
      libxml2-dev \
      libxslt1-dev \
      pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Create workspace
WORKDIR /site

# Pre-copy Gemfiles for efficient caching
COPY Gemfile Gemfile.lock /site/

# Install bundle dependencies
RUN bundle install

# Copy the rest of the project
COPY . .

# Default command: same as in GitHub Action
CMD ["bundle", "exec", "jekyll", "build", "--trace", "--verbose"]
