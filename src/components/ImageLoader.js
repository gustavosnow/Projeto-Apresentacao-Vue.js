// ImageLoader.js - Utilitário para importar imagens
import Imagem1 from '../assets/Imagem1.png';
import Imagem2 from '../assets/Imagem2.jpg';
import Imagem3 from '../assets/Imagem3.jpg';
import VueLogo from '../assets/vue.svg';

// Mapeamento de caminhos para importações
const images = {
  'src/assets/Imagem1.png': Imagem1,
  'src/assets/Imagem2.jpg': Imagem2,
  'src/assets/Imagem3.jpg': Imagem3,
  'src/assets/vue.svg': VueLogo
};

// Função para obter o caminho correto da imagem
export function getImageUrl(path) {
  return images[path] || '';
}
