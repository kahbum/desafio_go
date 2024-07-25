FROM golang:alpine3.20 AS builder

WORKDIR /usr/src/app

COPY fullcycle.go .

RUN go mod init kahbum/fullcycle
RUN go build -o fullcycle


FROM scratch

COPY --from=builder /usr/src/app/fullcycle /usr/local/bin/fullcycle

CMD [ "fullcycle" ]