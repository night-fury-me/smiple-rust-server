# Base image for the build stage, using Rust on Alpine for a small footprint
FROM rust:alpine AS builder

# Update package index and install build dependencies
RUN apk update && \
  apk add build-base

# Establishes a directory for the application source code
WORKDIR /home/rust-server

# Transfers the application source code to the container
COPY . .

# Updates Rust toolchain and compiles the application for release
RUN rustup update && cargo build --release

# Base image for the final stage, using a clean Alpine image for minimal size
FROM alpine

# Sets the working directory for the application in the final image
WORKDIR /home/rust-server

# Copies the compiled binary from the builder stage to the final image
COPY --from=builder /home/rust-server/target/release .

# Creates a non-root user for running the application, enhancing security
RUN adduser -D app_user

# Switches to the non-root user
USER app_user

# Indicates the network port that the application will listen on
EXPOSE 8080

# Specifies the executable to run when the container starts
CMD [ "./simple-rust-server" ]
