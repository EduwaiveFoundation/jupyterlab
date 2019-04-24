FROM leandatascience/jupyterlabconfiguration
ENV MAIN_PATH=/usr/local/bin/jpl_config
ENV LIBS_PATH=${MAIN_PATH}/libs
ENV CONFIG_PATH=${MAIN_PATH}/config
ENV NOTEBOOK_PATH=${MAIN_PATH}/notebooks

RUN pip install numpy
RUN pip install scipy
RUN pip install pandas
RUN pip install tensorflow
RUN pip install sklearn
RUN pip install --upgrade google-cloud-storage
RUN pip install --upgrade google-cloud-bigquery
RUN pip install google-cloud-language
RUN pip install google-cloud-translate
RUN pip install google-cloud-pubsub
RUN pip install google-cloud-vision
RUN pip install google-cloud-videointelligence
RUN export CLOUD_SDK_REPO="cloud-sdk-bionic" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update -y && apt-get install google-cloud-sdk -y

EXPOSE 8888

CMD cd ${MAIN_PATH} && sh config/run_jupyter.sh
