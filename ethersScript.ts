import { ethers } from 'ethers';

// Define the contract address and ABI
const contractAddress = '0x78a02fC3E0aaF8Fe95B63f7025e39bdFd51251de';
const contractABI = [
  // Add the ABI for each function you want to call
  {
    type: 'constructor',
    inputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'addAdmin',
    inputs: [{ name: 'newAdmin', type: 'address', internalType: 'address' }],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'admin',
    inputs: [{ name: '', type: 'address', internalType: 'address' }],
    outputs: [{ name: '', type: 'bool', internalType: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    name: 'removeAdmin',
    inputs: [{ name: 'adminToRemove', type: 'address', internalType: 'address' }],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'salt',
    inputs: [],
    outputs: [{ name: '', type: 'uint256', internalType: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    name: 'secureFunction',
    inputs: [{ name: 'value', type: 'uint256', internalType: 'uint256' }],
    outputs: [],
    stateMutability: 'nonpayable',
  },
];

// Define the provider and signer
const provider = new ethers.JsonRpcProvider('https://testnet-rpc.bitlayer.org');
const privateKey = process.env.PRIVATE_KEY;
if (!privateKey) {
  throw new Error('PRIVATE_KEY environment variable is not set');
}

const signer = new ethers.Wallet(privateKey, provider);

// Create a contract instance
const contract = new ethers.Contract(contractAddress, contractABI, signer);

// Call the functions
async function addAdmin(newAdmin: string) {
  try {
    const tx = await contract.addAdmin(newAdmin);
    await tx.wait();
    console.log('Admin added successfully');
  } catch (error) {
    console.error('Error adding admin:', error);
  }
}

async function removeAdmin(adminToRemove: string) {
  try {
    const tx = await contract.removeAdmin(adminToRemove);
    await tx.wait();
    console.log('Admin removed successfully');
  } catch (error) {
    console.error('Error removing admin:', error);
  }
}

async function secureFunction(value: number) {
  try {
    const tx = await contract.secureFunction(value);
    await tx.wait();
    console.log('secureFunction called successfully');
  } catch (error) {
    console.error('Error calling secureFunction:', error);
  }
}

// Call the functions manually
contract.addAdmin('0x74989DF6077Ddc4da81a640b514E6a372ff7217E', {
  gasLimit: 50000, 
  gasPrice: ethers.parseUnits('10', 'gwei') 
});

contract.addAdmin('0xF7E680C7ce96487d9cDfdEC73122EDF4435077Dc', { gasLimit: 50000, gasPrice: ethers.parseUnits('10', 'gwei') });
contract.removeAdmin('0xF7E680C7ce96487d9cDfdEC73122EDF4435077Dc', { gasLimit: 50000, gasPrice: ethers.parseUnits('10', 'gwei') });
contract.secureFunction(22, { gasLimit: 50000, gasPrice: ethers.parseUnits('10', 'gwei') });
