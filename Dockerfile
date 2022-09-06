FROM edwinchofong86/bitcoin-core:22.0-Alpine
COPY bitcoin.core22 /home/bitcoin22/ .bitcoin/bitcoin.core22
LABEL maintainer=edwinchofong86
RUN sha256sum -c .bitcoin/bitcoin.core22
VOLUME [/home/bitcoin/.bitcoin]
EXPOSE map[80/tcp:{} 8080/tcp:{}
