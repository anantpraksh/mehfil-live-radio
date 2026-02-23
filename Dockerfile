FROM jrottenberg/ffmpeg:6.0-alpine

WORKDIR /app

RUN apk add --no-cache bash python3

COPY . .

RUN mkdir -p public
RUN chmod +x start.sh

CMD ["bash", "./start.sh"]