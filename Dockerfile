# use the latest ubuntu image as base for the new image
FROM ubuntu:latest

#Run system update
# install python3 and pip3
RUN apt-get update && apt-get install -y python3 \
    python3-pip

#install jupyter
RUN pip3 install jupyter

#install all requirements from the requirements file
RUN pip3 install -r bot_requirements.txt

#create new system user
RUN useradd -ms /bin/bash jupyter

#change to the system user
USER jupyter

# set working directory
WORKDIR /home/jupyter

#start the jupyter notebook
ENTRYPOINT ["jupyter", "notebook", "--ip=*"]