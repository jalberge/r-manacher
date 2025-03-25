FROM rocker/r-ver:4

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev

# Copy package files
COPY . /usr/local/src/r-manacher

# Install the package
RUN R CMD INSTALL /usr/local/src/r-manacher

# Set the working directory
WORKDIR /usr/local/src/r-manacher

# Default command
CMD ["R"]
