FROM ubuntu:latest
RUN apt-get update
RUN yes | apt-get install netcat ed gawk
COPY ./headers headers
COPY ./api.awk api.awk
RUN mkfifo toob
RUN touch todos
EXPOSE 80
CMD while true; do < toob netcat -l -p 80 -q 0 | stdbuf -o0 gawk -f api.awk | ed todos | cat headers - > toob; done
