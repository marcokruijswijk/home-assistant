# Notice:
# When updating this file, please also update virtualization/Docker/Dockerfile.dev
# This way, the development image and the production image are kept in sync.

FROM python:3.6
LABEL maintainer="Paulus Schoutsen <Paulus@PaulusSchoutsen.nl>"

VOLUME /config

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install hass component dependencies
COPY requirements_basic.txt requirements_basic.txt
RUN pip3 install --no-cache-dir -r requirements_basic.txt

# Copy source
COPY . .

CMD [ "python", "-m", "homeassistant", "--config", "/config" ]
