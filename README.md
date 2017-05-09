This is a bit of a simple chat client for CTF's that would be valuable as it provides a wrapper to encryption.

How to install:

Debian/Ubuntu:
sudo apt install ncat

OR 
sudo apt install nmap

OSX:
brew install nmap

How does this work?
If you are the client and the server:

./server.sh <port> <ip to listen to>

This will build 2 files chat-cert.pem and chat-cert.key. The chat-cert.pem is the file you distribute to others.

./client <ip> <port>

You must have chat-cert.pem in order to connect to the server. Also the server does not relay or see any of the chat traffic even the person hosting the server MUST run the client.

Happy Hunting.
