FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y tzdata

RUN ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y \
  python3-pip

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get install imagemagick ffmpeg -y

RUN sed -i '/<policy domain="path" rights="none" pattern="@\*"/d' /etc/ImageMagick-6/policy.xml

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

CMD [ "python", "runShortGPT.py" ]