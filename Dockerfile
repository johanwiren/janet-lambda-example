FROM public.ecr.aws/amazonlinux/amazonlinux:2023
RUN dnf update
RUN dnf -y install gcc make git bash libcurl-devel tar

WORKDIR /build/janet
RUN git clone --depth 1 https://github.com/janet-lang/janet.git .
RUN git checkout $COMMIT

RUN make PREFIX=/app -j
RUN make PREFIX=/app install

WORKDIR /build/jpm
RUN git clone --depth 1 https://github.com/janet-lang/jpm .
RUN PREFIX=/app /app/bin/janet bootstrap.janet

ENV PATH="/app/bin:$PATH"
WORKDIR /app

RUN mkdir -p /app/project
COPY project.janet /app/project
WORKDIR /app/project

RUN jpm deps --local

COPY . /app/project/

RUN ./build-lambda.sh

CMD ["janet"] 
