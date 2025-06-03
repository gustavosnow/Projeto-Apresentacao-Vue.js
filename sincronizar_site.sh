#!/bin/bash

# Script de sincronização automática para o projeto Vue
# Este script clona o repositório, instala dependências, executa o build e reimplanta o site

echo "=== Iniciando sincronização do site Vue ==="
echo "Repositório: https://github.com/gustavosnow/projetoPW"

# Diretório de trabalho
WORK_DIR="/home/ubuntu/sync_vue"
mkdir -p $WORK_DIR
cd $WORK_DIR

# Limpar diretório se já existir
if [ -d "projeto_vue" ]; then
  echo "Removendo diretório existente..."
  rm -rf projeto_vue
fi

# Clonar o repositório
echo "Clonando o repositório..."
git clone https://github.com/gustavosnow/projetoPW.git projeto_vue
cd projeto_vue

# Instalar dependências
echo "Instalando dependências..."
npm install

# Verificar se o diretório de componentes existe
if [ ! -d "src/components" ]; then
  echo "Criando diretório de componentes..."
  mkdir -p src/components
fi

# Criar o utilitário ImageLoader.js se não existir
if [ ! -f "src/components/ImageLoader.js" ]; then
  echo "Criando utilitário ImageLoader.js..."
  cat > src/components/ImageLoader.js << 'EOF'
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
EOF
fi

# Verificar e corrigir o vite.config.js
echo "Verificando configuração do Vite..."
sed -i "s|base: process.env.NODE_ENV === 'production' ? '/projetoPW/' : '/',|base: '/',|g" vite.config.js

# Verificar e corrigir o SlideConteudo.vue
if grep -q "import { getImageUrl } from './ImageLoader.js';" src/components/SlideConteudo.vue; then
  echo "SlideConteudo.vue já está configurado corretamente."
else
  echo "Atualizando SlideConteudo.vue..."
  # Adicionar import
  sed -i "/<script>/a import { getImageUrl } from './ImageLoader.js';" src/components/SlideConteudo.vue
  
  # Adicionar método getImagePath
  sed -i "/props: {/i \ \ \ \ methods: {\n        getImagePath(path) {\n            return getImageUrl(path);\n        }\n    }," src/components/SlideConteudo.vue
  
  # Atualizar referência da imagem
  sed -i 's|:src="slide.imagem"|:src="getImagePath(slide.imagem)"|g' src/components/SlideConteudo.vue
fi

# Executar build
echo "Executando build do projeto..."
npm run build

# Implantar o site
echo "Implantando o site..."
echo "Para implantar o site, execute o comando:"
echo "deploy_apply_deployment --type=static --local_dir=/home/ubuntu/sync_vue/projeto_vue/dist"

echo "=== Sincronização concluída ==="
echo "O site está pronto para ser implantado."
