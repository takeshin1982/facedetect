FROM python:3.8-slim

# set environments
ENV PATH /usr/local/bin/python:$PATH
ENV PATH /root/.local/bin:$PATH
ENV PIP_DEFAULT_TIMEOUT=180

RUN echo "alias python3=python" >> $HOME/.bashrc

# pip upgrade
RUN python -m pip install --upgrade pip

# install requierements
COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt --user --no-cache-dir 

# run server 
COPY src/ .
ENTRYPOINT ["python", "server.py"]
EXPOSE 5000
