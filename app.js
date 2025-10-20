// Versión ligera que usa la wallet inyectada (Sui Wallet)
const PACKAGE_ID = "0xYOUR_PACKAGE_ID"; // Reemplaza por el package id publicado
const connectBtn = document.getElementById('connectBtn');
const mintBtn = document.getElementById('mintBtn');
const statusEl = document.getElementById('status');
const nftNameEl = document.getElementById('nftName');
const viewTxBtn = document.getElementById('viewTxBtn');
let latestTxDigest = null;

function setStatus(txt) { statusEl.innerText = txt; }

connectBtn.addEventListener('click', async () => {
  if (!window.suiWallet && !window.sui) {
    alert('Instala Sui Wallet desde https://sui.io/wallet');
    return;
  }
  try {
    const wallet = window.suiWallet || window.sui;
    await wallet.connect();
    const accounts = await wallet.requestAccounts();
    setStatus('Conectado: ' + accounts[0]);
    mintBtn.disabled = false;
  } catch (e) {
    console.error(e);
    setStatus('Error al conectar wallet');
  }
});

mintBtn.addEventListener('click', async () => {
  const wallet = window.suiWallet || window.sui;
  if (!wallet) { alert('Conecta la wallet primero'); return; }
  const name = nftNameEl.value.trim() || 'NFT Bootcamp';
  setStatus('Preparando transacción...');
  try {
    const tx = {
      packageObjectId: PACKAGE_ID,
      module: 'basic_nft',
      function: 'mint',
      arguments: [name, 'https://example.com/nft.png'],
      gasBudget: 20000000
    };
    const res = await wallet.signAndExecuteTransactionBlock({ transactionBlock: tx });
    latestTxDigest = res.digest || (res?.effects?.transactionDigest);
    setStatus('NFT minteado — tx: ' + latestTxDigest);
    viewTxBtn.classList.remove('hidden');
    viewTxBtn.onclick = () => window.open('https://explorer.sui.io/txblock/' + latestTxDigest + '?network=testnet', '_blank');
  } catch (err) {
    console.error(err);
    setStatus('Error al mintear: ' + (err.message || err));
  }
});
