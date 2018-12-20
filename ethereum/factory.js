import web3 from './web3';
import CampaignFactory from './build/CampaignFactory.json';

const instance = new web3.eth.Contract(
  JSON.parse(CampaignFactory.interface),
  '0x6a4c050E63b16730d2E63e78F6082B75386eCb6C'
);

export default instance;