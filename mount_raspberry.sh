start=$(fdisk -l /home/qemu_vms/*jessie.img | tail -n 1 | grep -Po '[[:digit:]]+' | head -n5 | tail -n 1) && \
echo "filesystem starts at sector $start" && \
offset=$(($start * 512)) && \
echo "using offset $offset" && \
mount -v -o offset=$offset -t ext4 /home/qemu_vms/*jessie.img /mnt/raspbian