FROM public.ecr.aws/amazonlinux/amazonlinux:2023
RUN dnf update
RUN dnf -y install gcc make git bash tar

# Install Janet
WORKDIR /build/janet
RUN git clone --depth 1 https://github.com/janet-lang/janet.git .
RUN git checkout $COMMIT

RUN make PREFIX=/app -j
RUN make PREFIX=/app install

# Install jpm
WORKDIR /build/jpm
RUN git clone --depth 1 https://github.com/janet-lang/jpm .
RUN PREFIX=/app /app/bin/janet bootstrap.janet

ENV PATH="/app/bin:$PATH"
WORKDIR /app

RUN mkdir -p /app/project

# Install native dependencies
RUN dnf -y install libcurl-devel

# Install janet dependencies
COPY project.janet /app/project
WORKDIR /app/project
RUN jpm deps --local

# Build the project
COPY . /app/project/
RUN jpm build --local

CMD ["janet"] 
