FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y socat 

# Buat user non-root untuk keamanan
RUN useradd -m ctf

# Copy file ke dalam container
WORKDIR /home/ctf
COPY challenge flag.txt entrypoint.sh ./

# Ubah pemilik file menjadi user ctf
RUN chown -R ctf:ctf /home/ctf
USER ctf

# Expose port untuk akses challenge
EXPOSE 1337

# Jalankan challenge
CMD ["/home/ctf/entrypoint.sh"]
