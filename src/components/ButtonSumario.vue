<template>
    <div class="button-sumario-position">
        <button class="button-sumario animate-nav-button"></button>

    </div>
</template>

<style>
.button-sumario {
    position: fixed;
    top: 20px;
    left: 20px;
    z-index: 1000;
}

.button-sumario {
    width: 60px;
    height: 60px;
    background: #2a2a2a;
    border: none;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
    cursor: pointer;
    transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
    padding: 0;
}

.button-sumario:focus {
    outline: 2px solid #42b883;
    outline-offset: 2px;
}

.button-sumario:hover:not(:disabled) {
    transform: translateY(-2px);
    box-shadow: 0 6px 14px rgba(0, 0, 0, 0.5);
    background: #353535;
}
</style>