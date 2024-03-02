
# A simple Rust web-server template

It's a basic template for creating Rust web servers and REST APIs, with containerization using Docker. This template outlines the steps to develop, containerize, and deploy a simple Rust web server that greets users via a RESTful endpoint. 

## Requirements

- Rust Programming Language
- Cargo (Rust's package manager)
- Docker (for containerization)

## Development Setup

1. **Clone the Template:**
   Start by cloning this template repository to set up the project environment. Ensure Rust and Cargo are installed on the local machine.

2. **Local Server Execution:**
   To run the server locally, navigate to the project's root directory in your terminal and execute:

   ```sh
   cargo build --release
   cargo run --release
   ```

   This command compiles the Rust application and initiates the server, defaulting to listen on `localhost:8080`.

## REST API Usage

Access the `/greet` endpoint to receive a response from the API endpoint. Include a `name` query parameter like so:

```sh
curl "http://localhost:8080/greet?name=NightFury"
```

Response:

```
Hello, NightFury, from Rust Server!
```

## Dockerization Guide

### Building a Docker Image

**Image Creation:**
Generate a Docker image by running:

```sh
docker build -t simple-rust-server .
```

### Running the Docker Container

Deploy the application as a Docker container with:

```sh
docker run -d -p 8080:8080 simple-rust-server
```

To specify a custom port:

```sh
docker run -d -p <HostPort>:<ContainerPort> -e PORT=<ContainerPort> simple-rust-server
```

Replace `<HostPort>` and `<ContainerPort>` with a desired port numbers.

## API Access via Docker

With the Docker container operational, the REST API is accessible as if the server were running locally. To greet someone, use:

```sh
curl "http://localhost:<Port>/greet?name=MrXYZ"
```

Ensure `<Port>` matches the port configured when launching the Docker container.

