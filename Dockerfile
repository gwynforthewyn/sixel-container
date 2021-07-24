FROM debian:latest

ENV USER=floob
ENV HOME_DIR=/home/${USER}

ENV PROJECT=sixel


RUN apt-get update && apt-get dist-upgrade
RUN apt-get install -y zsh python3 python3-pip python3-venv libsixel-dev
RUN adduser --shell $(which zsh) ${USER} --home ${HOME_DIR}

COPY ${PROJECT} ${HOME_DIR}/
USER ${USER}

WORKDIR ${HOME_DIR}

RUN pip3 install -r requirements.txt && python3 sixify.py
ENTRYPOINT ["python3", "sixify.py"]
