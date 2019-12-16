FROM python
STOPSIGNAL 9
COPY spleeter.sh /opt/
RUN pip install when-changed && chmod +x /opt/spleeter.sh \
&&  apt update && apt install -y docker.io

CMD bash -c '/opt/spleeter.sh; when-changed -v -r /files/input -c /opt/spleeter.sh %f'
