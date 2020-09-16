FROM python:3-slim
MAINTAINER paper2code <contact@paper2code.com>

WORKDIR /opt/tfkit-pwc/scripts

RUN pip3 install --upgrade pip && \
    pip3 install tfkit nlprep

COPY scripts /opt/tfkit-pwc/

ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8

CMD ["./train.sh"]
