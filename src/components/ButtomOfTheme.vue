<template>
  <div class="theme-toggle">
    <label class="switch">
      <input type="checkbox" @click="toggleDark()" :checked="isDark">
      <span class="slider round"></span>
    </label>
  </div>
</template>

<script setup>
import { useDark, useToggle } from '@vueuse/core'

const isDark = useDark({
  selector: 'html', // Aplicar no elemento raiz
  attribute: 'data-theme',
  valueDark: 'dark',
  valueLight: 'light',
})

const toggleDark = useToggle(isDark)
</script>

<style>
/* The switch - the box around the slider */
.bodyButton {
  width: 60px;
  display: flex;
  border-radius: 34px;
  min-height: 0vh;
}

.theme-toggle-container {
  position: fixed;
  top: 20px;
  right: 20px;
  z-index: 1000;
  position: fixed;

}

.switch {
  position: relative;
  width: 60px;
  height: 34px;
  display: inline-block;
}

/* Hide default HTML checkbox */
.switch input {
  opacity: 0;
  width: 0;
  height: 0;
}

/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked+.slider {
  background-color: #2196F3;
}

input:focus+.slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 8px;
}

.slider.round:before {
  border-radius: 50%;
}

body[data-theme='dark'] {
  background-image: linear-gradient(320deg, rgb(0, 86, 0), darkgreen, rgb(37, 37, 37), black);
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 200% 200%;
  animation: gradientShift 15s ease infinite;
  color: white;
  /* texto branco para contraste */
}

body[data-theme='light'] {
  background-image: linear-gradient(320deg, rgb(1, 1, 68), Darkblue, Blue, gray, white);
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 200% 200%;
  animation: gradientShift 15s ease infinite;
  color: white;
}
</style>