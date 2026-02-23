FROM jrottenberg/ffmpeg:6.0-alpine

WORKDIR /app

COPY . .

RUN mkdir -p public
RUN chmod +x start.sh

CMD ["bash ./start.sh"]