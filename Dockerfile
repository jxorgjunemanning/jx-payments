FROM python:3.7.8
ENV PYTHONUNBUFFERED 1
RUN mkdir -p /manning/rest_django_payments
RUN apt-get install -y libmariadb-dev
WORKDIR /manning/rest_django_payments
COPY requirements.txt /manning/rest_django_payments/
RUN pip3 install -r requirements.txt
ADD . /manning/rest_django_payments/

EXPOSE 8080

CMD ["gunicorn", "--chdir", "rest_django_payments", "--bind", ":8080", "rest_django_payments.wsgi:application"]
