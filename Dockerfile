FROM python

WORKDIR /usr/src/app

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install imagemagick ffmpeg -y

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

CMD [ "python", "runShortGPT.py" ]