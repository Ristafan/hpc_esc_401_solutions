FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    make \
    g++ \
    && apt-get clean

COPY . /poisson_solver

WORKDIR /poisson_solver

RUN make

CMD ["./main"]
