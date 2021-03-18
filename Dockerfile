FROM ubuntu
RUN apt-get update
RUN apt-get install -y apt-utils 
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y git
RUN apt-get install -y vim
RUN apt-get install -y zip && apt-get install -y unzip
RUN mkdir /home/qemu_vms
RUN wget -P "/home/qemu_vms" "http://downloads.raspberrypi.org/raspbian/images/raspbian-2017-04-10/2017-04-10-raspbian-jessie.zip"
RUN wget -P "/home/qemu_vms" "https://github.com/dhruvvyas90/qemu-rpi-kernel/blob/master/kernel-qemu-4.4.34-jessie"
RUN unzip /home/qemu_vms/*jessie.zip -d /home/qemu_vms/
RUN mkdir /mnt/raspbian
COPY ./mount_raspberry.sh /home/
RUN chmod +x /home/mount_raspberry.sh
WORKDIR /home