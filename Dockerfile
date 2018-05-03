FROM ubuntu:16.04

ARG rpcApiPort

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:ethereum/ethereum
RUN apt-get update
RUN apt-get install -y ethereum

EXPOSE ${rpcApiPort}

CMD [ "geth", "--rpc", "--rpcaddr", "0.0.0.0", "--rpcapi", "eth,web3", "--testnet", "--datadir", "/var/local/geth" ]
