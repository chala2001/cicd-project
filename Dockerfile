FROM alpine:latest

RUN apk add --no-cache python3

WORKDIR /app

COPY app.txt .

CMD ["python3", "-m", "http.server", "80"]
