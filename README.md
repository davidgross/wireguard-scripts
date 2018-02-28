# Wireguard Scripts

add and remove clients from a wireguard server.

`bash add-client.sh <client_name>` will create a config in clients for that client.

`bash remove-peer.sh <client_pub_key>` will remove the peer.

Download the generated `<client_name>.tar.gz` file and extract it. Follow the instructions in `SETUP.txt` in the resultiing folder.


### This set of scripts was heavily influcenced by:

https://www.ckn.io/blog/2017/11/14/wireguard-vpn-typical-setup/

https://www.wireguard.com/install/

https://www.wireguard.com/quickstart/
