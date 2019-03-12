ARG BASE_CONTAINER=jupyter/minimal-notebook

FROM $BASE_CONTAINER

LABEL maintainer="Matias Marenchino <mlmarenchino@gmail.com>"

RUN pip install papermill

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY src/*.ipynb ./

ENTRYPOINT ["sh", "entrypoint.sh"]
