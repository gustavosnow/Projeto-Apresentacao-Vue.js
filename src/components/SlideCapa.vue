<template>
    <section class="slide cover">
        <img src="https://upload.wikimedia.org/wikipedia/commons/9/95/Vue.js_Logo_2.svg" alt="Vue.js logo"
            class="vue-logo animate-logo" />
        <h2 class="animate-title">{{ capa.titulo }}</h2>

        <p class="animate-names"><strong>Integrantes:</strong></p>
        <ul class="animate-names">
            <li v-for="(nome, index) in capa.integrantes" :key="index">{{ nome }}</li>
        </ul>

        <p class="info animate-info">{{ capa.turma }}</p>
        <p class="info animate-info">{{ capa.escola }}</p>
        <p class="info animate-info">&copy; {{ capa.ano }}</p>
    </section>
</template>

<script>
export default {
    props: ['capa']
};
</script>