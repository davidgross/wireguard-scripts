# Wireguard Scripts

add and remove clients from a wireguard server.

`bash add-client.sh <client_name>` will create a config in clients for that client.

`bash remove-peer.sh <client_pub_key>` will remove the peer.

Download the generated `<client_name>.tar.gz` file and extract it. Follow the instructions in `SETUP.txt` in the resulting folder.


### This set of scripts was heavily influcenced by:

https://www.ckn.io/blog/2017/11/14/wireguard-vpn-typical-setup/

https://www.wireguard.com/install/

https://www.wireguard.com/quickstart/


## Installation
NOTE: this assumes some decent commandline knowlege.

1. Clone/fork(if you want to save your own configs) the Repo

1. install wireguard on server (https://www.wireguard.com/install/)

1. as `root`, `cd /etc/wireguard`, and create server keys: `wg genkey | tee server_private_key | wg pubkey > server_public_key`

1. copy wg0-server.example.conf in this project to /etc/wireguard/wg0.conf

1. edit `/etc/wireguard/wg0.conf` replace `PrivateKey = asdf123=` with the private key created above.
   Change any other settings you need different (ip range, network interfaces[eth0 is outgoing interface in this example])
   stop being root

1. start wireguard: `sudo wg-quick up wg0` 

1. add a client `bash add-client.sh <new-client>`

1. if everything is working right: `systemctl enable wg-quick@wg0.service`

1. (optional) commit your changes to your fork of this repo.


#### Contributing
If you see something wrong and have fixed it, or have something to add, make a Pull Request!




