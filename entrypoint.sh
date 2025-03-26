#!/bin/bash

chmod 444 /home/ctf/flag.txt  # Buat flag hanya bisa dibaca
chmod +x /home/ctf/challenge  # Pastikan binary bisa dijalankan

# Jalankan challenge dan buat bisa diakses via nc
socat TCP-LISTEN:1337,reuseaddr,fork EXEC:/home/ctf/challenge
