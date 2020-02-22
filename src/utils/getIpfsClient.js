import ipfsClient from "ipfs-http-client";l

const getIpfs = () => 
new Promise((resolve,reject)=> {
    console.log(ipfsClient);
    window.addEventListener("load", async () => {
        var ipfs = ipfsClient('localhost', '5001',{protocol: 'http'})
        console.log(ipfs);
        resolve(ipfs);
    });
});

export default getIpfs;