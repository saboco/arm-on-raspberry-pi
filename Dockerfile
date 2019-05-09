FROM ubuntu
RUN apt-get update && apt-get install -y wget
RUN apt-get install -y git
RUN apt-get install -y vim
RUN mkdir /home/qemu_vms
RUN wget -O "/home/qemu_vms/jessie.zip" "http://downloads.raspberrypi.org/raspbian/images/raspbian-2017-04-10/2017-04-10-raspbian-jessie.zip"
RUN git clone https://github.com/dhruvvyas90/qemu-rpi-kernel.git /home/qemu_vms/qemu-rpi-kernel/
RUN apt-get install -y qemu-system
RUN apt-get update && apt-get install -y zip unzip && unzip /home/qemu_vms/jessie.zip -d /home/qemu_vms/
RUN mkdir /mnt/raspbian
COPY ./mount_raspberry.sh /home/
RUN chmod +x /home/mount_raspberry.sh
WORKDIR /home
# CMD ["/home/mount_raspberry.sh"]
