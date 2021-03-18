sudo apt-get update
sudo apt-get update
sudo apt-get install -y apt-utils 
sudo apt-get install -y wget
sudo apt-get install -y git
sudo apt-get install -y vim
sudo apt-get install -y zip && apt-get install -y unzip
sudo mkdir /home/qemu_vms
sudo wget -P "/home/qemu_vms" "http://downloads.raspberrypi.org/raspbian/images/raspbian-2017-04-10/2017-04-10-raspbian-jessie.zip"
sudo wget -P "/home/qemu_vms" "https://github.com/dhruvvyas90/qemu-rpi-kernel/blob/master/kernel-qemu-4.4.34-jessie"
sudo unzip /home/qemu_vms/*jessie.zip -d /home/qemu_vms/
sudo mkdir /mnt/raspbian
sudo mkdir "/home/qemu_vms"
sudo apt-get install -y qemu-system
start=$(fdisk -l /home/qemu_vms/*jessie.img | tail -n 1 | grep -Po '[[:digit:]]+' | head -n5 | tail -n 1)
echo "filesystem starts at sector $start"
offset=$(($start * 512))
echo "using offset $offset"
sudo mount -v -o offset=$offset -t ext4 /home/qemu_vms/*jessie.img /mnt/raspbian
qemu-system-arm -kernel ~/qemu_vms/kernel-qemu-4.4.34-jessie -cpu arm1176 -m 256 -M versatilepb -serial stdio -append "root=/dev/sda2 rootfstype=ext4 rw" -hda ~/qemu_vms/2017-04-10-raspbian-jessie.img -incoming tcp:5022::22 -no-reboot