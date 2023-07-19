FROM python

WORKDIR /usr/src/app

RUN apt-get install imagemagick

RUN apt-get install ffmpeg

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

CMD [ "python", "runShortGPT.py" ]