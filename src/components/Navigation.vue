<template>
    <div :class="['navigation', isEdgeSlide ? 'navigation--center' : 'navigation--between']">
        <button v-show="currentSlideIndex > 0" @click="$emit('voltar')" class="animate-nav-button">
            <span class="material-icons-outlined">arrow_back</span>
        </button>
        <button v-show="currentSlideIndex < totalSlides - 1" @click="$emit('avancar')" class="animate-nav-button">
            <span class="material-icons-outlined">arrow_forward</span>
        </button>
    </div>
</template>

<script>
export default {
    props: ['currentSlideIndex', 'totalSlides', 'isEdgeSlide'],
    methods: {
        handleKeyDown(event) {
            switch(event.key) {
                case 'ArrowLeft':
                    if (this.currentSlideIndex > 0) {
                        this.$emit('voltar');
                    }
                    break;
                case 'ArrowRight':
                    if (this.currentSlideIndex < this.totalSlides - 1) {
                        this.$emit('avancar');
                    }
                    break;
            }
        }
    },
    mounted() {
        document.addEventListener('keydown', this.handleKeyDown);
    },
    beforeUnmount() {
        document.removeEventListener('keydown', this.handleKeyDown);
    }
};
</script>