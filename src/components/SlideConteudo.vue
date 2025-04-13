<template>
    <section class="slide">
        <h2 class="animate-slide-title">{{ slide.titulo }}</h2>

        <div class="content-wrapper" :class="{ 'image-left': slide.imageSide === 'left' }">
            <!-- Bloco de Texto -->
            <div class="text-block">
                <div class="text-content justified-text" v-html="formattedContent"></div>
            </div>

            <!-- Bloco de Imagem em Destaque -->
            <div v-if="slide.imagem" class="image-block">
                <div class="image-container">
                    <img :src="slide.imagem" :alt="slide.altText || 'Imagem ilustrativa'" class="full-cover-image"
                        :style="{ 'border-radius': borderRadius }">
                    <div class="image-overlay"></div>
                    <p v-if="slide.imageCaption" class="image-caption">{{ slide.imageCaption }}</p>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
export default {
    props: {
        slide: {
            type: Object,
            default: () => ({
                borderRadius: '12px' // Bordas arredondadas
            })
        }
    },
    computed: {
        formattedContent() {
            if (!this.slide.conteudo) return ''
            return this.slide.conteudo
                .replace(/\n\n/g, '</p><p class="paragraph">')
                .replace(/\n/g, '<br>')
        },
        borderRadius() {
            return this.slide.borderRadius || '12px'
        }
    }
}
</script>

<style scoped>
/* Layout Principal */
.content-wrapper {
    display: flex;
    gap: 24px;
    margin-top: 20px;
}

/* Direções */
.content-wrapper.image-left {
    flex-direction: row-reverse;
}

.content-wrapper:not(.image-left) {
    flex-direction: row;
}

/* Bloco de Texto */
.text-block {
    flex: 1;
    background-color: #2a2a2a;
    padding: 24px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
}

/* Bloco de Imagem em Destaque */
.image-block {
    position: relative;
    flex: 1;
    min-width: 45%;
    min-height: 300px;
}

.image-container {
    position: relative;
    width: 100%;
    height: 100%;
    overflow: hidden;
    border-radius: 12px;
}

.full-cover-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: all 0.4s ease-in-out;
}

.image-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.2);
    opacity: 0;
    transition: opacity 0.3s ease;
    pointer-events: none;
    border-radius: inherit;
}

.image-container:hover .full-cover-image {
    transform: scale(1.05);
}

.image-container:hover .image-overlay {
    opacity: 1;
}

.image-caption {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    padding: 12px;
    background-color: rgba(0, 0, 0, 0.7);
    color: white;
    text-align: center;
    transition: all 0.3s ease;
    transform: translateY(10px);
    opacity: 0;
}

.image-container:hover .image-caption {
    transform: translateY(0);
    opacity: 1;
}

/* Texto Justificado */
.justified-text {
    text-align: justify;
    text-justify: inter-word;
    line-height: 1.6;
    hyphens: auto;
}

.paragraph {
    margin-bottom: 1em;
}

/* Responsividade */
@media (max-width: 768px) {
    .content-wrapper {
        flex-direction: column;
    }

    .image-block {
        min-height: 250px;
        min-width: 100%;
    }

    .full-cover-image {
        min-height: 250px;
    }
}
</style>