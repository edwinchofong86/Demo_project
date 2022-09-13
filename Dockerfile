ADD https://hub.docker.com/layers/lightninglabs/bitcoin-core/22-alpine\
/images/sha256-b06692d315bb580d325ba267ef4066d3815f330058ba40455d5188790b4047fb?context=explore
LABEL maintainer=Edwin
RUN sha256sum -c .bitcoin/bitcoin.core22 #https://codesigningstore.com/how-to-check-file-checksum 
VOLUME [/home/bitcoin/.bitcoin]
EXPOSE map[80/tcp:{} 8080/tcp:{}
