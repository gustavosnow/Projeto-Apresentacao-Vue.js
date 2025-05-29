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
          titulo: "Surgimento do Vue.js",
          conteudo: "O Vue.js foi criado por Evan You em 2014.\n\nPrincipais características:\n- Progressivo\n- Acessível\n- Versátil",
          imagem: "https://miro.medium.com/v2/resize:fit:500/0*xkJgg-6HskYrQ3N7.jpeg",
          imageSide: "right",
          imageCaption: "Evan You, criador do Vue.js",
          alt: "Evan You, criador do Vue.js"
        },
        {
          titulo: "O que é Sustentabilidade?",
          conteudo: "Sustentabilidade significa suprir as necessidades do presente...",
          imagem: "https://source.unsplash.com/featured/?sustainability,green",
          imageSide: "left"
        },
        {
          titulo: "Como Podemos Ajudar?",
          conteudo: "Separar o lixo, economizar água, usar menos plástico...",
          imagem: "https://source.unsplash.com/featured/?recycle,ecology",
          imageSide: "right"
        },
        {
          titulo: "Conclusão",
          conteudo: "Cada pequeno gesto conta...",
          imagem: "https://source.unsplash.com/featured/?future,environment",
          imageSide: "left"
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