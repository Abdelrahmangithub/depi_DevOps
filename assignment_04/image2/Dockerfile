FROM alpine:latest

#ARG in build only
ARG USER_NAME=abduu
#To make it after build added to v2
ENV USER_NAME=${USER_NAME}
ENV APP_HOME=/myapp

WORKDIR $APP_HOME

COPY hello.txt .

#To see that will remove tar
ADD file1.tar.gz .

#Will add curl to the image --no-cache to make the size of the image small
RUN apk add --no-cache curl

#Check if ADD works or not Can be commented as I use it in CMD below
RUN echo "Showing contents of /myapp:" && ls -R .

#For V1
#ENTRYPOINT ["echo"]
#CMD ["Hello", "$USER_NAME from Alpine"]

ENTRYPOINT ["sh","-c"]
CMD ["echo hello $USER_NAME from Alpine;echo Showing contents && ls -R /myapp"]
