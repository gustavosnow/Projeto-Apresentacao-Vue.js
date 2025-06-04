<template>
  <div class="app">
    <Header v-if="currentSlideIndex === 0" />
    <ButtomOfTheme />
    <ButtonSumario @mudar-slide="mudarSlide" />
    <main class="slide-container">
      <transition name="fade" mode="out-in">
        <SlideCapa v-if="currentSlideIndex === 0" :capa="capa" key="capa" />
        <SlideConteudo v-else :slide="currentSlide" :key="currentSlideIndex" />
      </transition>

      <Navigation :currentSlideIndex="currentSlideIndex" :totalSlides="totalSlides" :isEdgeSlide="isEdgeSlide"
        @voltar="voltarSlide" @avancar="avancarSlide" />
    </main>
  </div>
</template>

<script>
import Header from './components/Header.vue'
import SlideCapa from './components/SlideCapa.vue'
import SlideConteudo from './components/SlideConteudo.vue'
import Navigation from './components/Navigation.vue'
import ButtomOfTheme from './components/ButtomOfTheme.vue'
import ButtonSumario from './components/ButtonSumario.vue'

export default {
  components: { Header, SlideCapa, SlideConteudo, Navigation, ButtomOfTheme, ButtonSumario },
  data() {
    return {
      currentSlideIndex: 0,
      capa: {
        titulo: "Vue.js: História e Aplicações",
        integrantes: ["Guilherme França", "Gustavo Coelho", "Ikki Silva", "Tiago Oliveira"],
        turma: "BES 2024",
        escola: "UEPA Campus XXIII - Parauapebas",
        ano: "2025"
      },
      slides: [
        {
          titulo: "História do Vue.js",
          conteudo: "O Vue.js é um framework JavaScript progressivo usado para construir interfaces de usuário e aplicações web. Sua história é relativamente recente, mas cheia de marcos importantes.",
          imagem: "src/assets/Imagem1.png",
          imageSide: "right",
          imageCaption: "Vue.js",
          alt: "Logo do Vue.js"
        },
        {
          titulo: "Origem e Criação (2013–2014)",
          conteudo: "• Criador: Evan You, ex-desenvolvedor do Google, teve a ideia do Vue.js enquanto trabalhava com ferramentas como AngularJS no Google.\n\n• Motivação: Ele queria criar algo mais leve e flexível do que o AngularJS, mantendo a reatividade e a simplicidade na criação de interfaces.\n\n• Lançamento inicial: Em fevereiro de 2014, Evan lançou o Vue.js como um projeto pessoal de código aberto no GitHub.",
          imagem: "src/assets/Imagem2.jpg",
          imageSide: "left",
          imageCaption: "Evan You, criador do Vue.js",
          alt: "Foto de Evan You, criador do Vue.js"
        },
        {
          titulo: "Crescimento e Adoção (2015–2016)",
          conteudo: "• O <b>Vue</b> começou a ganhar notoriedade na comunidade de desenvolvedores por ser:\n<ol> ◦ Simples de aprender.\n </ol><ol> ◦ Leve e fácil de integrar em projetos existentes.\n </ol><ol> ◦ Reativo e com sintaxe amigável.\n\n </ol>• <b>Vue 1.0</b> foi lançado em <b>outubro de 2015</b>.\n\n• A comunidade começou a crescer, contribuindo com plugins, ferramentas e documentação.",
        },
        {
          titulo: "Vue 2.0 – Consolidação (2016)",
          conteudo: "• Lançado em <b>setembro de 2016</b>.\n\n•	Melhorias significativas em desempenho e arquitetura.\n\n•	Introdução do <b>Virtual DOM</b>, <b>Render Functions</b> e <b>Server-Side Rendering (SSR)</b>.\n\n•	Tornou-se uma alternativa real ao React e Angular.",
        },
         {
          titulo: "Popularidade Mundial (2017–2019)",
          conteudo: "• Vue começou a ser adotado por grandes empresas como Alibaba, Xiaomi, Baidu e Laravel (como framework frontend padrão).\n\n•	A comunidade cresceu globalmente, com conferências, cursos e eventos em vários países.\n\n•	Recebeu apoio através do Patreon e de patrocinadores, permitindo que Evan e outros colaboradores se dedicassem em tempo integral.",
        },
         {
          titulo: "Vue 3.0 – Evolução Moderna (2020)",
          conteudo: "• <b>Lançado oficialmente em setembro de 2020</b>.\n\n•	Reescrito com <b>TypeScript</b>, oferecendo melhor tipagem e manutenção.\n\n•	Introdução da <b>Composition API</b>, que oferece mais flexibilidade e organização para aplicações maiores.\n\n•	Melhorias de desempenho e tamanho de bundle.\n\n•	Ferramentas novas como o <b>Vite</b>, um bundler moderno também criado por Evan You, ganharam popularidade ao lado do Vue.",
        },
        {
          titulo: "Vue.js Atualmente (2021–2025)",
          conteudo: "• Vue 3 se tornou a versão padrão em <b>2022</b>.\n\n• Amplamente utilizado em aplicações SPA, SSR, PWA e até mesmo mobile (com frameworks como Quasar e NativeScript-Vue).\n\n•	A comunidade continua forte e ativa.\n\n•	Ferramentas como <b>Pinia (substituto do Vuex)</b>, <b>Vue Router</b> e o <b>Nuxt 3</b> impulsionam o ecossistema.\n\n•	Evan You continua liderando o desenvolvimento do framework.",
        },
        {
          titulo: "Vantagens do Vue.js",
          conteudo: "1. Fácil de aprender\n\n2. Documentação excelente\n\n3. Reatividade nativa\n\n4. Flexibilidade e integração\n\n5. Comunidade ativa e crescente\n\n6. Performance\n\n7. Composition API (Vue 3)\n\n8. Ferramentas modernas",
        },
        {
          titulo: "Desvantagens do Vue.js",
          conteudo: "1. Menor adoção corporativa no Ocidente\n\n2. Menor ecossistema comparado ao React\n\n3. Comunidade menor que a do React\n\n4. Escolhas demais podem confundir\n\n5. Atualizações nem sempre são retrocompatíveis\n\n",
        },
        {
          titulo: "Áreas onde o Vue.js é bem utilizado",
          conteudo: "<b>1. Sistemas de Gestão (ERP, CRM, Painéis Admin).\n\n2. Single Page Applications (SPAs)\n\n3. Prototipagem Rápida de Interfaces</b>",
        },
        {
          titulo: "Empresas que usam Vue.js",
          conteudo: "1. Xiaomi\n\n2. Nintendo\n\n3. BMW\n\n4. Adobe",
          imagem: "src/assets/Imagem3.jpg",
          imageSide: "right",
          imageCaption: "Empresas que usam Vue.js",
          alt: "Imagem com logos de empresas que usam Vue.js: Xiaomi, Nintendo, BMW, Adobe"
        },
        {
          titulo: "Fluxograma do Projeto",
          imagem: "src/assets/fluxograma_vue_simples.png",
          alt: "Fluxograma sobre o Projeto feito em Vue.js, que mostra as relações entre os componentes com o arquivo principal."
        }
      ]
    };
  },
  computed: {
    totalSlides() {
      return this.slides.length + 1;
    },
    currentSlide() {
      return this.slides[this.currentSlideIndex - 1];
    },
    isEdgeSlide() {
      return this.currentSlideIndex === 0 || this.currentSlideIndex === this.totalSlides - 1;
    }
  },
  methods: {

    avancarSlide() {
      if (this.currentSlideIndex < this.totalSlides - 1) {
        this.currentSlideIndex++;
        this.reiniciarAnimacaoBotoes();
      }
    },
    voltarSlide() {
      if (this.currentSlideIndex > 0) {
        this.currentSlideIndex--;
        this.reiniciarAnimacaoBotoes();
      }
    },

    mudarSlide(index) {
      this.currentSlideIndex = index;
      this.reiniciarAnimacaoBotoes();
    },

    reiniciarAnimacaoBotoes() {
      this.$nextTick(() => {
        const buttons = document.querySelectorAll(".animate-nav-button");
        buttons.forEach((btn) => {
          btn.classList.remove("animate-nav-button");
          btn.classList.add("retrigger-animation");
          void btn.offsetWidth;
          btn.classList.remove("retrigger-animation");
          btn.classList.add("animate-nav-button");


        });
      });
    }
  }
}

// Removed duplicate export default as it is not allowed
import '/styles.css';
</script>