FROM python:3.7

# set environments
ENV PATH /usr/local/bin/python:$PATH
ENV PATH /root/.local/bin:$PATH
ENV PIP_DEFAULT_TIMEOUT=180

RUN echo "alias python3=python" >> $HOME/.bashrc

# pip upgrade
RUN python -m pip install --upgrade pip

# install requierements
RUN pip install Flask 
RUN pip install torch==1.8.0+cpu torchvision==0.9.0+cpu torchaudio===0.8.0 -f https://download.pytorch.org/whl/torch_stable.html
# run server 
COPY src/ .
ENTRYPOINT ["python", "server.py"]
EXPOSE 5000
