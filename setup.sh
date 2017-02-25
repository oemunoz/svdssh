#/bin/bash

if [[ "$DEFKEY" ]]; then
  echo "Warning: using default keys must be security risk."
  echo "Ensure that you regenrate keys for the first run of the container."
else
  echo "Building sshd keys."
  /bin/rm -v /etc/ssh/ssh_host_*
  dpkg-reconfigure openssh-server
  supervisorctl restart sshd
fi

chmod 700 /root/.ssh/ && chown root.root /root/.ssh/authorized_keys

mkdir -p /home/$SVDUSER/.ssh && cp /root/.ssh/authorized_keys /home/$SVDUSER/.ssh/
groupadd $SVDGROUP && \
   useradd $SVDUSER -g $SVDGROUP -m && \
   echo "$SVDUSER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
   chmod 700 /home/$SVDUSER/.ssh && \
   chown -R $SVDUSER /home/$SVDUSER/.ssh
