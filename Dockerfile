# Etapa de compilación
FROM alpine:latest as builder

RUN apk update && apk add --no-cache build-base git python3 py3-pip

RUN git clone https://github.com/yt-dlp/yt-dlp.git /yt-dlp
WORKDIR /yt-dlp

RUN python3 -m venv /venv
RUN /venv/bin/pip install --no-cache-dir -r requirements.txt
RUN /venv/bin/python setup.py install

# Eliminar paquetes no necesarios del entorno virtual
RUN source /venv/bin/activate && pip uninstall -y pip setuptools


# Etapa de ejecución
FROM alpine:latest

RUN mkdir /download
WORKDIR /download

RUN apk update && apk add --no-cache python3 ffmpeg

COPY --from=builder /venv /venv

# Limpiar archivos innecesarios en la imagen final
RUN apk del build-base py3-pip
RUN find /venv \( -name '*.pyc' -o -name '__pycache__' \) -delete

ENTRYPOINT ["/venv/bin/python", "-m", "yt_dlp"]
CMD ["--help"]

